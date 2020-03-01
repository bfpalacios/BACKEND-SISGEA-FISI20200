package edu.taller.sisgea.procesos.service.curso;

import edu.taller.sisgea.procesos.mapper.ICursoMapper;
import edu.taller.sisgea.procesos.model.Curso;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.excel.exception.ReadingExcelFileException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
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
public class CursoService extends MantenibleService<Curso> implements ICursoService {

    private static final String CURSO_NO_ENCONTRADO = "La programación del Curso %s no existe";
    private final ICursoMapper cursoMapper;

    public CursoService(@Qualifier("ICursoMapper") IMantenibleMapper<Curso> mantenibleMapper) {
        super(mantenibleMapper);
        this.cursoMapper = (ICursoMapper) mantenibleMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<Curso> buscarTodosCursos() {
        return this.buscarTodos();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public Curso buscarCurso(String idCurso) {
        return this.cursoMapper.buscarCurso(idCurso).orElseThrow(
                () -> new RecursoNoEncontradoException(CURSO_NO_ENCONTRADO, idCurso));
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<Curso> cargaArchivos(List<MultipartFile> multipartfiles) {
        List<Curso> listaCursos = new ArrayList<>();
        for (MultipartFile multipartfile : multipartfiles) {
			String filename = multipartfile.getOriginalFilename();
			try (BufferedInputStream bis = new BufferedInputStream(multipartfile.getInputStream())) {
				listaCursos = this.leerExcel(filename, bis);
			} catch (IOException e) {
				throw new RecursoNoEncontradoException(e.getMessage());
			}
		}
		return listaCursos;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public List<Curso> leerExcel(String filename, InputStream inputStream){
        try (Workbook workbook = WorkbookFactory.create(inputStream)) {
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator();
            Row row;
            rowIterator.next();
            List<Curso> listaFilas = new ArrayList<>();
            while (rowIterator.hasNext()) {
                row = rowIterator.next();
                String idPlan           = String.valueOf(row.getCell(0));
                String idCurso          = String.valueOf(row.getCell(1));
                Integer ciclo           = (int) Double.parseDouble(String.valueOf(row.getCell(2)));
                String especialidad     = String.valueOf(row.getCell(3));
                String descripcion      = String.valueOf(row.getCell(4));
                Double creditaje        = Double.parseDouble(String.valueOf(row.getCell(5)));
                String tipo             = String.valueOf(row.getCell(6));
                String grupo            = String.valueOf(row.getCell(7));
                Curso fila = Curso.builder()
                        .idPlan(idPlan)
                        .idCurso(idCurso)
                        .ciclo(ciclo)
                        .especialidad(especialidad)
                        .descripcion(descripcion)
                        .creditaje(creditaje)
                        .tipo(tipo)
                        .grupo(grupo)
                        .build();
                listaFilas.add(fila);
            }
            return this.cargarExcel(listaFilas);
        } catch (IOException ex) {
            throw new ReadingExcelFileException("Asegúrese de que se trata de un archivo Excel. Nombre de archivo: " + filename);
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public List<Curso> cargarExcel(List<Curso> listaCursos){
    	listaCursos.forEach((cur)->{
			Curso curso = Curso.builder()
					.idPlan(cur.getIdPlan())
					.idCurso(cur.getIdCurso())
					.ciclo(cur.getCiclo())
					.especialidad(cur.getEspecialidad())
					.descripcion(cur.getDescripcion())
					.creditaje(cur.getCreditaje())
					.tipo(cur.getTipo())
					.grupo(cur.getGrupo())
					.build();
			this.registrarCurso(curso);
		});
		return listaCursos;
    }
    
    @Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Curso registrarCurso(Curso curso) {
		this.registrar(curso);
		return this.buscarCurso(curso.getIdCurso());
	}

}
