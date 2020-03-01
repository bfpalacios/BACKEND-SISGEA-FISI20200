package edu.taller.sisgea.seguridad.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.taller.sisgea.seguridad.model.CriterioBusquedaAutorizacion;
import edu.taller.sisgea.seguridad.model.Recurso;

@Mapper
public interface IAuthMapper {
	
	Boolean autenticarUsuario(CriterioBusquedaAutorizacion criterio);
	
	List<Recurso> buscarPermisosPorUsuario(CriterioBusquedaAutorizacion criterio);
}
