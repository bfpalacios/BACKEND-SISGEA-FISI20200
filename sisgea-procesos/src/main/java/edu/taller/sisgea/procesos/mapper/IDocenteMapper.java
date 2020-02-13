package edu.taller.sisgea.procesos.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.procesos.model.Docente;

import org.apache.ibatis.annotations.Mapper;
import java.util.Optional;

@Mapper
public interface IDocenteMapper extends IMantenibleMapper<Docente> {
	
	Optional<Docente> buscarDocente(String idDocente);
	
}
