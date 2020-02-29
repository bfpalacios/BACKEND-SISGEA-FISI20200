package edu.taller.sisgea.seguridad.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.seguridad.model.Usuario;

import org.apache.ibatis.annotations.Mapper;
import java.util.Optional;

@Mapper
public interface IUsuarioMapper extends IMantenibleMapper<Usuario> {
	
	Optional<Usuario> buscarUsuario(String idUsuario);
	
}
