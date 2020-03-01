package edu.taller.sisgea.procesos.service.programacion;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.procesos.model.Programacion;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface IProgramacionService extends IMantenibleService<Programacion> {
	
	List<Programacion> buscarTodosProgramacion();
	
	Programacion buscarProgramacion(String idCurso, Integer seccion);
	
	List<Programacion> cargarArchivos(List<MultipartFile> multipartfiles);
	
	Programacion registrarProgramacion(Programacion programacion);
	
}