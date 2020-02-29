package edu.taller.sisgea.seguridad.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.seguridad.model.Perfil;

import org.apache.ibatis.annotations.Mapper;
import java.util.Optional;

@Mapper
public interface IPerfilMapper extends IMantenibleMapper<Perfil> {
	
	Optional<Perfil> buscarPerfil(Integer idPerfil);
	
}
