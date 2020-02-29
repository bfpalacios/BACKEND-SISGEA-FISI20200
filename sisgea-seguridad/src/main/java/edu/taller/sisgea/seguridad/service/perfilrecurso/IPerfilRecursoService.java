package edu.taller.sisgea.seguridad.service.perfilrecurso;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.seguridad.model.PerfilRecurso;

import java.util.List;

public interface IPerfilRecursoService extends IMantenibleService<PerfilRecurso> {
	
	List<PerfilRecurso> buscarTodosPerfilRecurso();
	
	List<PerfilRecurso> buscarRecursosPerfil(Integer idPerfil);
	
	PerfilRecurso buscarPerfilRecurso(Integer idPerfilRecurso);
	
	PerfilRecurso registrarPerfilRecurso(PerfilRecurso recurso);
	
	PerfilRecurso actualizarPerfilRecurso(Integer idPerfilRecurso, PerfilRecurso recurso);
	
	void eliminarPerfilRecurso(Integer idPerfilRecurso);
	
}