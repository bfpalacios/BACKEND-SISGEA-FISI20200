package edu.taller.sisgea.procesos.service.horario;

import edu.taller.sisgea.procesos.mapper.IHorarioMapper;
import edu.taller.sisgea.procesos.model.Horario;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.excel.exception.ReadingExcelFileException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Validated
@RestController
public class HorarioService extends MantenibleService<Horario> implements IHorarioService {

    private static final String HORARIO_NO_ENCONTRADO = "El Horario de id de id curso %s, seccion %d, id horario %s no existe";
    private final IHorarioMapper horarioMapper;

    public HorarioService(@Qualifier("IHorarioMapper") IMantenibleMapper<Horario> mantenibleMapper) {
        super(mantenibleMapper);
        this.horarioMapper = (IHorarioMapper) mantenibleMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<Horario> buscarTodosHorario() {
        return this.buscarTodos();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public Horario buscarHorario(Integer idHorario, String idCurso,Integer seccion) {
        return this.horarioMapper.buscarHorario(idHorario,idCurso,seccion).orElseThrow(
                () -> new RecursoNoEncontradoException(HORARIO_NO_ENCONTRADO,idHorario,idCurso,seccion));
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<Horario> cargarArchivos(List<MultipartFile> multipartfiles) {
        List<Horario> listaHorarios = new ArrayList<>();
        for (MultipartFile multipartfile : multipartfiles) {
            String filename = multipartfile.getOriginalFilename();
            try (BufferedInputStream bis = new BufferedInputStream(multipartfile.getInputStream())) {
            	listaHorarios = this.leerExcel(filename, bis);
            } catch (IOException e) {
                throw new RecursoNoEncontradoException(e.getMessage());
            }
        }
        return listaHorarios;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public List<Horario> leerExcel(String filename, InputStream inputStream){
        try (Workbook workbook = WorkbookFactory.create(inputStream)) {
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator();
            Row row;
            rowIterator.next();
            List<Horario> listaFilas = new ArrayList<>();
            while (rowIterator.hasNext()) {
                row = rowIterator.next();
                Integer idHorario           = (int) Double.parseDouble(String.valueOf(row.getCell(0)));
                String idCurso              = String.valueOf(row.getCell(1));
                Integer seccion             = (int) Double.parseDouble(String.valueOf(row.getCell(2)));
                String dia                  = String.valueOf(row.getCell(3));
                String horarioInicio        = String.valueOf(row.getCell(4));
                String horarioFin           = String.valueOf(row.getCell(5));
                Horario fila = Horario.builder()
                        .idHorario(idHorario)
                        .idCurso(idCurso)
                        .seccion(seccion)
                        .dia(dia)
                        .horarioInicio(horarioInicio)
                        .horarioFin(horarioFin)
                        .build();
                listaFilas.add(fila);
            }
            return this.cargarExcel(listaFilas);
        } catch (IOException ex) {
            throw new ReadingExcelFileException("Asegúrese de que se trata de un archivo Excel. Nombre de archivo: " + filename);
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public List<Horario> cargarExcel(List<Horario> listaHorarios){
    	listaHorarios.forEach((hor)->{
			Horario horario = Horario.builder()
					.idHorario(hor.getIdHorario())
					.idCurso(hor.getIdCurso())
					.seccion(hor.getSeccion())
					.dia(hor.getDia())
					.horarioInicio(hor.getHorarioInicio())
					.horarioFin(hor.getHorarioFin())
					.build();
			this.registrarHorario(horario);
		});
		return listaHorarios;
    }
    
    @Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Horario registrarHorario(Horario horario) {
		this.registrar(horario);
		return this.buscarHorario(horario.getIdHorario(), horario.getIdCurso(), horario.getSeccion());
	}

}
