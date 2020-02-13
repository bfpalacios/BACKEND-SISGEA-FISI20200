package edu.taller.sisgea.procesos.service.docente;

import edu.taller.sisgea.procesos.mapper.IDocenteMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.excel.exception.ReadingExcelFileException;
import ob.commons.excel.util.TypesUtil;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.procesos.model.resultadocarga.ResultadoCarga;
import edu.taller.sisgea.procesos.model.Docente;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

@Service
public class DocenteService extends MantenibleService<Docente> implements IDocenteService {
	
	private static final String PLAN_NO_ENCONTRADO = "El Docente %s no existe";
	private final IDocenteMapper docenteMapper;
	
	private @Autowired DataSource dataSource;
	
	public DocenteService(@Qualifier("IDocenteMapper") IMantenibleMapper<Docente> mantenibleMapper) {
		super(mantenibleMapper);
		this.docenteMapper = (IDocenteMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Docente> buscarTodosDocente() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Docente buscarDocente(String idDocente) {
		return this.docenteMapper.buscarDocente(idDocente).orElseThrow(
				() -> new RecursoNoEncontradoException(PLAN_NO_ENCONTRADO, idDocente));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<ResultadoCarga> cargarArchivos(List<MultipartFile> multipartfiles) {
		List<ResultadoCarga> listaResultados = new ArrayList<>();
		for (MultipartFile multipartfile : multipartfiles) {
			String filename = multipartfile.getOriginalFilename();
			try (BufferedInputStream bis = new BufferedInputStream(multipartfile.getInputStream())) {
				ResultadoCarga resultadoCarga = leerExcel(filename, bis);
				listaResultados.add(resultadoCarga);
			} catch (IOException e) {
				throw new RecursoNoEncontradoException(e.getMessage());
			}
		}
		return listaResultados;
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public ResultadoCarga leerExcel(String filename, InputStream inputStream){
		try (Workbook workbook = WorkbookFactory.create(inputStream)) {
			Sheet sheet = workbook.getSheetAt(0);
			Iterator<Row> rowIterator = sheet.iterator();
			Row row;
			rowIterator.next();
			List<Docente> listaFilas = new ArrayList<>();
			while (rowIterator.hasNext()) {
				row = rowIterator.next();
				String idDocente		= String.valueOf(row.getCell(0));
				String nombres			= String.valueOf(row.getCell(1));
				String apellidos		= String.valueOf(row.getCell(2));
				String tipo		= String.valueOf(row.getCell(3));
				Docente fila = Docente.builder()
						.idDocente(idDocente)
						.nombres(nombres)
						.apellidos(apellidos)
						.tipo(tipo)
						.build();
				listaFilas.add(fila);
			}
			cargarExcel(listaFilas);
			ResultadoCarga resultadoCarga = ResultadoCarga.builder()
					.nombreArchivo(filename)
					.numeroRegistros(listaFilas.size())
					.exito(true)
					.build();
			return resultadoCarga;
		} catch (IOException ex) {
			throw new ReadingExcelFileException(
							"Asegúrese de que se trata de un archivo Excel. Nombre de archivo: " + filename);
		} catch (Exception ex) {
			ResultadoCarga resultadoCargaFallida = ResultadoCarga.builder()
					.nombreArchivo(filename)
					.numeroRegistros(0)
					.exito(false)
					.build();
			return resultadoCargaFallida;
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void cargarExcel(List<Docente> listaFilas){
		int batchSize = 1000;
		if(listaFilas.size()<=0){
			return;
		}
		try(Connection conn = dataSource.getConnection()){
			conn.setAutoCommit(false);
			try{
				PreparedStatement stmt = conn.prepareStatement(
					"INSERT INTO MAE_DOCENTE("+
						"ID_DOCENTE	      	," +
						"NOMBRES	      	," +
						"APELLIDOS	  		," +   
						"TIPO				 " +
					") VALUES ("+
						"?,"+
						"?,"+
						"?,"+
						"? "+
					")") ;
				int[] idx = { 0 };
				Iterator<Docente> itDocente = listaFilas.iterator();
				Docente docente;
				while(itDocente.hasNext()){
					docente = itDocente.next();
					try{
						TypesUtil.validarBDString(stmt,  1, docente.getIdDocente());
						TypesUtil.validarBDString(stmt,  2, docente.getNombres());
						TypesUtil.validarBDString(stmt,  3, docente.getApellidos());
						TypesUtil.validarBDString(stmt,  4, docente.getTipo());
						stmt.addBatch();
						idx[0]++;
						if (idx[0] % batchSize == 0 ) {
							stmt.executeBatch();
							conn.commit();
							stmt.clearBatch();
							stmt.clearParameters();
							idx[0] = 0;
						}
					}catch(SQLException e){
						if (conn != null) {
							try {
								conn.rollback();
							} catch (Exception ex) {
							}
						}
					}
				}

				if(idx[0]>0){
					stmt.executeBatch();
					conn.commit();
				}
				
			}catch(SQLException e){
				if (conn != null) {
					try {
						conn.rollback();
					} catch (Exception ex) {
					}
				}
				e.printStackTrace();
			}
		}catch (SQLException e ){
			e.printStackTrace();
		}
	}
	
}
