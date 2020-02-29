package edu.taller.sisgea.seguridad.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.seguridad.model.PerfilRecurso;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface IPerfilRecursoMapper extends IMantenibleMapper<PerfilRecurso> {
	
	Optional<PerfilRecurso> buscarPerfilRecurso(Integer idPerfilRecurso);
	
	List<PerfilRecurso> buscarRecursosPerfil(Integer idPerfil);
	
}
