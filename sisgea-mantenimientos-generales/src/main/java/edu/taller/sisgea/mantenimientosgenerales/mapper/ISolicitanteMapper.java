package edu.taller.sisgea.mantenimientosgenerales.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.mantenimientosgenerales.model.Solicitante;

import org.apache.ibatis.annotations.Mapper;
import java.util.Optional;

@Mapper
public interface ISolicitanteMapper extends IMantenibleMapper<Solicitante> {
	
	Optional<Solicitante> buscarSolicitante(Integer idSolicitante);
	
}
