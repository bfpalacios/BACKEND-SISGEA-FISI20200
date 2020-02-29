package edu.taller.sisgea.procesos.service.plan;

import edu.taller.sisgea.procesos.mapper.IPlanMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.error.model.ErrorResponse;
import ob.commons.excel.exception.ReadingExcelFileException;
import ob.commons.excel.util.TypesUtil;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.procesos.model.Plan;

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
public class PlanService extends MantenibleService<Plan> implements IPlanService {
	
	private static final String PLAN_NO_ENCONTRADO = "El Plan %s no existe";
	private final IPlanMapper planMapper;
	
	private @Autowired DataSource dataSource;
	
	public PlanService(@Qualifier("IPlanMapper") IMantenibleMapper<Plan> mantenibleMapper) {
		super(mantenibleMapper);
		this.planMapper = (IPlanMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Plan> buscarTodosPlan() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Plan buscarPlan(String idPlan) {
		return this.planMapper.buscarPlan(idPlan).orElseThrow(
				() -> new RecursoNoEncontradoException(PLAN_NO_ENCONTRADO, idPlan));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<ErrorResponse> cargarArchivos(List<MultipartFile> multipartfiles) {
		List<ErrorResponse> listaExcepciones = new ArrayList<>();
		for (MultipartFile multipartfile : multipartfiles) {
			String filename = multipartfile.getOriginalFilename();
			try (BufferedInputStream bis = new BufferedInputStream(multipartfile.getInputStream())) {
				leerExcel(filename, bis);
			} catch (IOException e) {
				throw new RecursoNoEncontradoException(e.getMessage());
			}
		}
		return listaExcepciones;
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void leerExcel(String filename, InputStream inputStream){
		try (Workbook workbook = WorkbookFactory.create(inputStream)) {
			Sheet sheet = workbook.getSheetAt(0);
			Iterator<Row> rowIterator = sheet.iterator();
			Row row;
			rowIterator.next();
			List<Plan> listaFilas = new ArrayList<>();
			while (rowIterator.hasNext()) {
				row = rowIterator.next();
				String idPlan			= String.valueOf(row.getCell(0));
				String facultad			= String.valueOf(row.getCell(1));
				String escuela			= String.valueOf(row.getCell(2));
				String especialidad		= String.valueOf(row.getCell(3));
				String descripcionPlan	= String.valueOf(row.getCell(4));
				Plan fila = Plan.builder()
						.idPlan(idPlan)
						.facultad(facultad)
						.escuela(escuela)
						.especialidad(especialidad)
						.descripcionPlan(descripcionPlan)
						.build();
				listaFilas.add(fila);
			}
			cargarExcel(listaFilas);
		} catch (SQLException e) {
			throw new ReadingExcelFileException("Verificar si el Plan no tiene dependencias ya existentes. \nEstado SQL: " + e.getSQLState()+"\nMensaje: "+e.getMessage());
		} catch (IOException ex) {
			throw new ReadingExcelFileException("Asegúrese de que se trata de un archivo Excel. Nombre de archivo: " + filename);
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void cargarExcel(List<Plan> listaFilas) throws SQLException{
		int batchSize = 1000;
		if(listaFilas.size()<=0){
			return;
		}
		Connection conn = dataSource.getConnection();
		try{
			conn.setAutoCommit(false);
			try{
				PreparedStatement stmt = conn.prepareStatement(
					"INSERT INTO MAE_PLAN("+
						"ID_PLAN	      	," +
						"FACULTAD	      	," +
						"ESCUELA	  		," +   
						"ESPECIALIDAD		," +
						"DESCRIPCION		" +
					") VALUES ("+
						"?,"+
						"?,"+
						"?,"+
						"?,"+
						"? "+
					")") ;
				int[] idx = { 0 };
				Iterator<Plan> itPlan = listaFilas.iterator();
				Plan plan;
				while(itPlan.hasNext()){
					plan = itPlan.next();
					try{
						TypesUtil.validarBDString(stmt,  1, plan.getIdPlan());
						TypesUtil.validarBDString(stmt,  2, plan.getFacultad());
						TypesUtil.validarBDString(stmt,  3, plan.getEscuela());
						TypesUtil.validarBDString(stmt,  4, plan.getEspecialidad());
						TypesUtil.validarBDString(stmt,  5, plan.getDescripcionPlan());
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
