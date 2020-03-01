package edu.taller.sisgea.procesos.service.docente;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.procesos.model.Docente;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface IDocenteService extends IMantenibleService<Docente> {
	
	List<Docente> buscarTodosDocente();
	
	Docente buscarDocente(String idDocente);
	
	List<Docente> cargarArchivos(List<MultipartFile> multipartfiles);
	
	Docente registrarDocente(Docente docente);
	
}
