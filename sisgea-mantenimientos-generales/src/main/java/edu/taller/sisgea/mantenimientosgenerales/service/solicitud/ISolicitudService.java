package edu.taller.sisgea.mantenimientosgenerales.service.solicitud;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.taller.sisgea.mantenimientosgenerales.model.Solicitud;

public interface ISolicitudService {

	List<Solicitud> buscarTodosSolictud();

	Solicitud buscarSolicitud(Integer idSolicitud);

	Solicitud registrarSolicitud(Solicitud solicitud);

	Solicitud actualizarSolicitud(Integer idSolicitud, Solicitud solicitud);

	Solicitud aprobarSolicitud(Integer idSolicitud, Solicitud solicitud);

	void eliminarSolicitud(Integer idSolicitud);

	// casos de guardar
	void guardarArchivo(MultipartFile file) throws IOException;
}
