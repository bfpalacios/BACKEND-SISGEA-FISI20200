package edu.taller.sisgea.mantenimientosgenerales.service.solicitud;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.taller.sisgea.mantenimientosgenerales.mapper.ISolicitudMapper;
import edu.taller.sisgea.mantenimientosgenerales.model.Solicitud;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;

@Service
public class SolicitudService extends MantenibleService<Solicitud> implements ISolicitudService {

	private static final String SOLICITUD_NO_ENCONTRADO = "El Espacio Académico %s no existe";
	private static final String APROBAR = "APROBAR";
	private static final String RECHAZAR = "RECHAZAR";
	private static final String CANCELAR = "CANCELAR";

	private final ISolicitudMapper solicitudMapper;
	private String uploadFolder = ".//src//main//resource//archivos//";

	public SolicitudService(@Qualifier("ISolicitudMapper") IMantenibleMapper<Solicitud> mantenibleMapper) {
		super(mantenibleMapper);
		this.solicitudMapper = (ISolicitudMapper) mantenibleMapper;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Solicitud> buscarTodosSolictud() {
		return this.solicitudMapper.buscarTodosSolictud();

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Solicitud buscarSolicitud(Integer idSolicitud) {
		return this.solicitudMapper.buscarSolicitud(idSolicitud)
				.orElseThrow(() -> new RecursoNoEncontradoException(SOLICITUD_NO_ENCONTRADO, idSolicitud));

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Solicitud registrarSolicitud(Solicitud solicitud) {
		this.registrar(solicitud);
		return this.buscarSolicitud(solicitud.getIdSolicitud());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Solicitud actualizarSolicitud(Integer idSolicitud, Solicitud solicitud) {
		solicitud.setIdSolicitud(idSolicitud);
		this.actualizar(solicitud);
		return this.buscarSolicitud(solicitud.getIdSolicitud());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarSolicitud(Integer idSolicitud) {
		Solicitud solicitud = Solicitud.builder().idSolicitud(idSolicitud).build();
		this.eliminar(solicitud);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Solicitud aprobarSolicitud(Integer idSolicitud) {
		Solicitud solicitud = new Solicitud();
		solicitud.setIdSolicitud(idSolicitud);
		this.solicitudMapper.aprobarSolicitud(APROBAR,idSolicitud);
		return this.buscarSolicitud(solicitud.getIdSolicitud());
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Solicitud rechazarSolicitud(Integer idSolicitud) {
		Solicitud solicitud = new Solicitud();
		solicitud.setIdSolicitud(idSolicitud);
		this.solicitudMapper.aprobarSolicitud(RECHAZAR, idSolicitud);
		return this.buscarSolicitud(solicitud.getIdSolicitud());
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Solicitud cancelarSolicitud(Integer idSolicitud) {
		Solicitud solicitud = new Solicitud();
		solicitud.setIdSolicitud(idSolicitud);
		this.solicitudMapper.aprobarSolicitud(CANCELAR, idSolicitud);
		return this.buscarSolicitud(solicitud.getIdSolicitud());
	}
	
	//casos de carga
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void guardarArchivo(MultipartFile file) throws IOException {
		if(!file.isEmpty()) {
			byte[] bytesArchivo = file.getBytes();
			Path path = Paths.get(uploadFolder + file.getOriginalFilename());
			Files.write(path,bytesArchivo);
		}
	}

}
