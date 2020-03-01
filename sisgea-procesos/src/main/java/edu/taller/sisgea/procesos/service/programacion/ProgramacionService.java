package edu.taller.sisgea.procesos.service.programacion;

import edu.taller.sisgea.procesos.mapper.IProgramacionMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.excel.exception.ReadingExcelFileException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.procesos.model.Programacion;

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
public class ProgramacionService extends MantenibleService<Programacion> implements IProgramacionService {
	
	private static final String PROGRAMACION_NO_ENCONTRADO = "La programación del Curso %s , Sección %d no existe";
	private final IProgramacionMapper programacionMapper;
	
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
	public List<Programacion> cargarArchivos(List<MultipartFile> multipartfiles) {
		List<Programacion> listaProgramaciones = new ArrayList<>();
		for (MultipartFile multipartfile : multipartfiles) {
			String filename = multipartfile.getOriginalFilename();
			try (BufferedInputStream bis = new BufferedInputStream(multipartfile.getInputStream())) {
				listaProgramaciones = this.leerExcel(filename, bis);
			} catch (IOException e) {
				throw new RecursoNoEncontradoException(e.getMessage());
			}
		}
		return listaProgramaciones;
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Programacion> leerExcel(String filename, InputStream inputStream){
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
			return this.cargarExcel(listaFilas);
		} catch (IOException ex) {
			throw new ReadingExcelFileException("Asegúrese de que se trata de un archivo Excel. Nombre de archivo: " + filename);
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Programacion> cargarExcel(List<Programacion> listaProgramaciones){
		listaProgramaciones.forEach((prog)->{
			Programacion programacion = Programacion.builder()
					.idCurso(prog.getIdCurso())
					.seccion(prog.getSeccion())
					.idDocente(prog.getIdDocente())
					.tope(prog.getTope())
					.matriculados(prog.getMatriculados())
					.turno(prog.getTurno())
					.aula(prog.getAula())
					.build();
			this.registrarProgramacion(programacion);
		});
		return listaProgramaciones;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Programacion registrarProgramacion(Programacion programacion) {
		this.registrar(programacion);
		return this.buscarProgramacion(programacion.getIdCurso(), programacion.getSeccion());
	}
	
}
