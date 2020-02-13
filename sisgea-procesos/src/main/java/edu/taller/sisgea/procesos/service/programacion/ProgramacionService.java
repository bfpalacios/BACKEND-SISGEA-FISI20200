package edu.taller.sisgea.procesos.service.programacion;

import edu.taller.sisgea.procesos.mapper.IProgramacionMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.excel.exception.ReadingExcelFileException;
import ob.commons.excel.util.TypesUtil;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.procesos.model.Programacion;
import edu.taller.sisgea.procesos.model.resultadocarga.ResultadoCarga;

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
public class ProgramacionService extends MantenibleService<Programacion> implements IProgramacionService {
	
	private static final String PROGRAMACION_NO_ENCONTRADO = "La programación del Curso %s , Sección %d no existe";
	private final IProgramacionMapper programacionMapper;
	
	private @Autowired DataSource dataSource;
	
	public ProgramacionService(@Qualifier("IProgramacionMapper") IMantenibleMapper<Programacion> mantenibleMapper) {
		super(mantenibleMapper);
		this.programacionMapper = (IProgramacionMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Programacion> buscarTodosProgramacion() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Programacion buscarProgramacion(String idCurso, Integer seccion) {
		return this.programacionMapper.buscarProgramacion(idCurso, seccion).orElseThrow(
				() -> new RecursoNoEncontradoException(PROGRAMACION_NO_ENCONTRADO, idCurso, seccion));
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
			List<Programacion> listaFilas = new ArrayList<>();
			while (rowIterator.hasNext()) {
				row = rowIterator.next();
				String idCurso			= String.valueOf(row.getCell(0));
				Integer seccion			= Integer.parseInt(String.valueOf(row.getCell(1)));
				String idDocente		= String.valueOf(row.getCell(2));
				Integer tope			= Integer.parseInt(String.valueOf(row.getCell(3)));
				Integer matriculados	= Integer.parseInt(String.valueOf(row.getCell(4)));
				String turno			= String.valueOf(row.getCell(5));
				String aula				= String.valueOf(row.getCell(6));
				Programacion fila = Programacion.builder()
						.idCurso(idCurso)
						.seccion(seccion)
						.idDocente(idDocente)
						.tope(tope)
						.matriculados(matriculados)
						.turno(turno)
						.aula(aula)
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
	public void cargarExcel(List<Programacion> listaFilas){
		int batchSize = 1000;
		if(listaFilas.size()<=0){
			return;
		}
		try(Connection conn = dataSource.getConnection()){
			conn.setAutoCommit(false);
			try{
				PreparedStatement stmt = conn.prepareStatement(
					"INSERT INTO MAE_PROGRAMACION("+
						"ID_CURSO	  	," +
						"SECCION		," +
						"ID_DOCENTE	  	," +   
						"TOPE			," +
						"MATRICULADOS	," +   
						"TURNO			," +
						"AULA			" +
					") VALUES ("+
						"?,"+
						"?,"+
						"?,"+
						"?,"+
						"?,"+
						"?,"+
						"? "+
					")") ;
				int[] idx = { 0 };
				Iterator<Programacion> itProgramacion = listaFilas.iterator();
				Programacion programacion;
				while(itProgramacion.hasNext()){
					programacion = itProgramacion.next();
					try{
						TypesUtil.validarBDString(stmt,  1, programacion.getIdCurso());
						TypesUtil.validarBDInteger(stmt,  2, programacion.getSeccion());
						TypesUtil.validarBDString(stmt,  3, programacion.getIdDocente());
						TypesUtil.validarBDInteger(stmt,  4, programacion.getTope());
						TypesUtil.validarBDInteger(stmt,  5, programacion.getMatriculados());
						TypesUtil.validarBDString(stmt,  6, programacion.getTurno());
						TypesUtil.validarBDString(stmt,  7, programacion.getAula());
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
