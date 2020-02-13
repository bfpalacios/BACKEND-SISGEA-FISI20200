package edu.taller.sisgea.consultasgenerales.controller.solicitud.rest;

import ob.commons.spring.validation.validation.IdNumerico;
import ob.commons.spring.validation.validation.group.IRegistro;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import edu.taller.sisgea.consultasgenerales.model.solicitud.Solicitud;
import edu.taller.sisgea.consultasgenerales.service.solicitud.ISolicitudService;

import javax.validation.groups.Default;
import java.util.List;

@Validated
@RestController
public class SolicitudRestController {
	
	private final ISolicitudService solicitudService;
	
	public SolicitudRestController(ISolicitudService SolicitudService) {
		this.solicitudService = SolicitudService;
	}
	
	@GetMapping(value = "/solicitud-espacios")
	public List<Solicitud> buscarTodosSolicitudes() {
		return this.solicitudService.buscarTodosSolictud();
	}
	
	@PostMapping(value = "/solicitud-espacios", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public Solicitud registrarSolicitud(@Validated({IRegistro.class, Default.class}) @RequestBody Solicitud Solicitud) {
		return this.solicitudService.registrarSolicitud(Solicitud);
	}
	
	@PutMapping(value = "/solicitud-espacios/{idSolicitud}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Solicitud actualizarSolicitud(@IdNumerico(maxRange = 65535) @PathVariable Integer idSolicitud,
	                             @Validated @RequestBody Solicitud Solicitud) {
		return this.solicitudService.actualizarSolicitud(idSolicitud, Solicitud);
	}
	
	@DeleteMapping(value = "/solicitud-espacios/{idSolicitud}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarSolicitud(@IdNumerico(maxRange = 65535) @PathVariable Integer idSolicitud) {
		this.solicitudService.eliminarSolicitud(idSolicitud);
	}
	
}
