package edu.taller.sisgea.procesos.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.procesos.model.AsignacionManualEspacioAcademico;

import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IAsignacionManualEspacioAcademicoMapper extends IMantenibleMapper<AsignacionManualEspacioAcademico> {
	
	Optional<AsignacionManualEspacioAcademico> buscarAsignacionManualEspacioAcademico(Integer idAsignacion);
	
}
