package edu.taller.sisgea.consultasgenerales.mapper.solicitud;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import edu.taller.sisgea.consultasgenerales.model.solicitud.Solicitud;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;

@Mapper
public interface ISolicitudMapper extends IMantenibleMapper<Solicitud> {
	
	List<Solicitud> buscarTodosSolictud();
	
	Optional<Solicitud> buscarSolicitud(Integer idSolicitud);
	
}
