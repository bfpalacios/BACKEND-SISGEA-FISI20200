package edu.taller.sisgea.procesos.service.plan;

import edu.taller.sisgea.procesos.mapper.IPlanMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.excel.exception.ReadingExcelFileException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.procesos.model.Plan;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class PlanService extends MantenibleService<Plan> implements IPlanService {
	
	private static final String PLAN_NO_ENCONTRADO = "El Plan %s no existe";
	private final IPlanMapper planMapper;
	
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
	public void cargarArchivos(List<MultipartFile> multipartfiles) {
		for (MultipartFile multipartfile : multipartfiles) {
			String filename = multipartfile.getOriginalFilename();
			try (BufferedInputStream bis = new BufferedInputStream(multipartfile.getInputStream())) {
				this.leerExcel(filename, bis);
			} catch (IOException e) {
				throw new RecursoNoEncontradoException(e.getMessage());
			}
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Plan> leerExcel(String filename, InputStream inputStream){
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
			return this.cargarExcel(listaFilas);
		} catch (IOException ex) {
			throw new ReadingExcelFileException("Asegúrese de que se trata de un archivo Excel. Nombre de archivo: " + filename);
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Plan> cargarExcel(List<Plan> listaPlanes) {
		listaPlanes.forEach((pla)->{
			Plan plan = Plan.builder()
					.idPlan(pla.getIdPlan())
					.facultad(pla.getFacultad())
					.escuela(pla.getEscuela())
					.especialidad(pla.getEspecialidad())
					.descripcionPlan(pla.getDescripcionPlan())
					.build();
			this.registrarPlan(plan);
		});
		return listaPlanes;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Plan registrarPlan(Plan plan) {
		this.registrar(plan);
		return this.buscarPlan(plan.getIdPlan());
	}
	
}
