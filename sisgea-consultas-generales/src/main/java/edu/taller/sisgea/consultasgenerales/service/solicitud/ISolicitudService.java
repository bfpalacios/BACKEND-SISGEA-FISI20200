package edu.taller.sisgea.consultasgenerales.service.solicitud;

import java.util.List;

import edu.taller.sisgea.consultasgenerales.model.solicitud.Solicitud;

public interface ISolicitudService {
	List<Solicitud> buscarTodosSolictud();
	
	Solicitud buscarSolicitud(Integer idSolicitud);
	
	Solicitud registrarSolicitud(Solicitud solicitud);
	
	Solicitud actualizarSolicitud(Integer idSolicitud,Solicitud solicitud);
	
	void eliminarSolicitud(Integer idSolicitud);
}
