package edu.taller.sisgea.seguridad.mapper;

import java.util.List;

import edu.taller.sisgea.seguridad.model.CriterioBusquedaAutorizacion;
import edu.taller.sisgea.seguridad.model.Recurso;

public interface IAuthMapper {
	
	Boolean autenticarUsuario(CriterioBusquedaAutorizacion criterio);
	
	List<Recurso> buscarPerfilPorUsuario(CriterioBusquedaAutorizacion criterio);
}
