package edu.taller.sisgea.procesos.service.curso;

import edu.taller.sisgea.procesos.model.Curso;
import ob.commons.mantenimiento.service.IMantenibleService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ICursoService extends IMantenibleService<Curso> {

    List<Curso> buscarTodosCursos();

    Curso buscarCurso (String idCurso);

    List<Curso> cargaArchivos(List<MultipartFile> multipartfiles);
    
    Curso registrarCurso(Curso curso);

}
