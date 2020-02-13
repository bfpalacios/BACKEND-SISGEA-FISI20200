package edu.taller.sisgea.procesos.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.procesos.model.Programacion;

import org.apache.ibatis.annotations.Mapper;
import java.util.Optional;

@Mapper
public interface IProgramacionMapper extends IMantenibleMapper<Programacion> {
	
	Optional<Programacion> buscarProgramacion(String idCurso, Integer seccion);
	
}
