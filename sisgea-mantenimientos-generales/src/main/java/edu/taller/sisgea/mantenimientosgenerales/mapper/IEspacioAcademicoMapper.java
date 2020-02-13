package edu.taller.sisgea.mantenimientosgenerales.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.mantenimientosgenerales.model.EspacioAcademico;

import org.apache.ibatis.annotations.Mapper;
import java.util.Optional;

@Mapper
public interface IEspacioAcademicoMapper extends IMantenibleMapper<EspacioAcademico> {
	
	Optional<EspacioAcademico> buscarEspacioAcademico(Integer idEspacioAcademico);
	
}
