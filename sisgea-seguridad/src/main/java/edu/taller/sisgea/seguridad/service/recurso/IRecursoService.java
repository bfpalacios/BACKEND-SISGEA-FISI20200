package edu.taller.sisgea.seguridad.service.recurso;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.seguridad.model.Recurso;

import java.util.List;

public interface IRecursoService extends IMantenibleService<Recurso> {
	
	List<Recurso> buscarTodosRecurso();
	
	Recurso buscarRecurso(String idRecurso);
	
	Recurso registrarRecurso(Recurso recurso);
	
	Recurso actualizarRecurso(String idRecurso, Recurso recurso);
	
	void eliminarRecurso(String idRecurso);
	
}