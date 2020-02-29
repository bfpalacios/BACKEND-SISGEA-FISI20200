package edu.taller.sisgea.seguridad.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.seguridad.model.Recurso;

import org.apache.ibatis.annotations.Mapper;
import java.util.Optional;

@Mapper
public interface IRecursoMapper extends IMantenibleMapper<Recurso> {
	
	Optional<Recurso> buscarRecurso(String idRecurso);
	
}
