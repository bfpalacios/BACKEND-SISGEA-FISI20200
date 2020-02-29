package edu.taller.sisgea.mantenimientosgenerales.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import edu.taller.sisgea.mantenimientosgenerales.model.Solicitud;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;

@Mapper
public interface ISolicitudMapper extends IMantenibleMapper<Solicitud> {
	
	List<Solicitud> buscarTodosSolictud();
	
	Optional<Solicitud> buscarSolicitud(Integer idSolicitud);
	
	Solicitud aprobarSolicitud(Solicitud solicitud);
	
}
