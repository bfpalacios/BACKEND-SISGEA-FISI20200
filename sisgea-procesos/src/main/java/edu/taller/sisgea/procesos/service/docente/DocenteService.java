package edu.taller.sisgea.procesos.service.docente;

import edu.taller.sisgea.procesos.mapper.IDocenteMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.excel.exception.ReadingExcelFileException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.procesos.model.Docente;

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
public class DocenteService extends MantenibleService<Docente> implements IDocenteService {
	
	private static final String DOCENTE_NO_ENCONTRADO = "El Docente %s no existe";
	private final IDocenteMapper docenteMapper;
	
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
				() -> new RecursoNoEncontradoException(DOCENTE_NO_ENCONTRADO, idDocente));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Docente> cargarArchivos(List<MultipartFile> multipartfiles) {
		List<Docente> listaDocentes = new ArrayList<>();
		for (MultipartFile multipartfile : multipartfiles) {
			String filename = multipartfile.getOriginalFilename();
			try (BufferedInputStream bis = new BufferedInputStream(multipartfile.getInputStream())) {
				listaDocentes = this.leerExcel(filename, bis);
			} catch (IOException e) {
				throw new RecursoNoEncontradoException(e.getMessage());
			}
		}
		return listaDocentes;
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Docente> leerExcel(String filename, InputStream inputStream){
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
			return this.cargarExcel(listaFilas);
		} catch (IOException ex) {
			throw new ReadingExcelFileException("Asegúrese de que se trata de un archivo Excel. Nombre de archivo: " + filename);
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List<Docente> cargarExcel(List<Docente> listaDocentes){
		listaDocentes.forEach((doc)->{
			Docente docente = Docente.builder()
					.idDocente(doc.getIdDocente())
					.nombres(doc.getNombres())
					.apellidos(doc.getApellidos())
					.tipo(doc.getTipo())
					.build();
			this.registrarDocente(docente);
		});
		return listaDocentes;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Docente registrarDocente(Docente docente) {
		this.registrar(docente);
		return this.buscarDocente(docente.getIdDocente());
	}
	
}
