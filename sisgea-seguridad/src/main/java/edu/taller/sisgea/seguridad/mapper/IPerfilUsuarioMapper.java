package edu.taller.sisgea.seguridad.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.seguridad.model.PerfilUsuario;

import org.apache.ibatis.annotations.Mapper;
import java.util.Optional;

@Mapper
public interface IPerfilUsuarioMapper extends IMantenibleMapper<PerfilUsuario> {
	
	Optional<PerfilUsuario> buscarPerfilUsuario(Integer idPerfilUsuario);
	
}
