package edu.taller.sisgea.mantenimientosgenerales.controller.rest;

import ob.commons.spring.validation.validation.IdNumerico;
import ob.commons.spring.validation.validation.group.IRegistro;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import edu.taller.sisgea.mantenimientosgenerales.model.Solicitud;
import edu.taller.sisgea.mantenimientosgenerales.service.solicitud.ISolicitudService;

import javax.validation.groups.Default;

import java.io.IOException;
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
	public Solicitud registrarSolicitud(
			@Validated({ IRegistro.class, Default.class }) @RequestBody Solicitud Solicitud) {
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
	
	@PutMapping(value = "/solicitud-espacios/aprobar/{idSolicitud}")
	public Solicitud aprobarSolicitud(@IdNumerico(maxRange = 65535) @PathVariable Integer idSolicitud) {
		return this.solicitudService.aprobarSolicitud(idSolicitud);
	}
	
	@PutMapping(value = "/solicitud-espacios/rechazar/{idSolicitud}")
	public Solicitud rechazarSolicitud(@IdNumerico(maxRange = 65535) @PathVariable Integer idSolicitud) {
		return this.solicitudService.rechazarSolicitud(idSolicitud);
	}
	
	@PutMapping(value = "/solicitud-espacios/cancelar/{idSolicitud}")
	public Solicitud cancelarSolicitud(@IdNumerico(maxRange = 65535) @PathVariable Integer idSolicitud) {
		System.out.println("entro a rest");
		return this.solicitudService.cancelarSolicitud(idSolicitud);
	}
	
	@PostMapping(value = "/solicitud-espacios/carga", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<?> registrarSolicitudArchivo(@RequestBody Solicitud solicitud) throws IOException {
		Solicitud resultadoSolicitud = this.solicitudService.registrarSolicitud(solicitud);
		if(resultadoSolicitud == null) {
			return new ResponseEntity<Object>("Ha fallado la carga", HttpStatus.CREATED);
		}
		return new ResponseEntity<Object>("Registro exitoso", HttpStatus.OK);
	}
	
	@PostMapping(value = "/solicitud-espacios/carga-archivo")
	public ResponseEntity<?> guardarArchivo(@RequestParam("file") MultipartFile file) {
		if(!file.isEmpty()) {
			return new ResponseEntity<Object>("Seleccionar un archivo", HttpStatus.CREATED);
		}
		try {
			this.solicitudService.guardarArchivo(file);
		} catch(IOException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Object>("Carga exitosa", HttpStatus.OK);
	}

}
