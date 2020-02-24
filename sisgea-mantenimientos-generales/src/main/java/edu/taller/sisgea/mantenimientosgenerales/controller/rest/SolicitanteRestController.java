package edu.taller.sisgea.mantenimientosgenerales.controller.rest;

import edu.taller.sisgea.mantenimientosgenerales.model.Solicitante;
import ob.commons.spring.validation.validation.IdNumerico;
import ob.commons.spring.validation.validation.group.IRegistro;
import edu.taller.sisgea.mantenimientosgenerales.service.solicitante.ISolicitanteService;
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

import javax.validation.groups.Default;
import java.util.List;

@Validated
@RestController
public class SolicitanteRestController {
	
	private final ISolicitanteService solicitanteService;
	
	public SolicitanteRestController(ISolicitanteService solicitanteService) {
		this.solicitanteService = solicitanteService;
	}
	
	@GetMapping(value = "/solicitantes")
	public List<Solicitante> buscarTodosSolicitantes() {
		return this.solicitanteService.buscarTodosSolicitante();
	}
	
	@PostMapping(value = "/solicitantes", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public Solicitante registrarSolicitante(@Validated({IRegistro.class, Default.class}) @RequestBody Solicitante solicitante) {
		return this.solicitanteService.registrarSolicitante(solicitante);
	}
	
	@PutMapping(value = "/solicitantes/{idSolicitante}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Solicitante actualizarSolicitante(@IdNumerico(maxRange = 65535) @PathVariable Integer idSolicitante,
	                             @Validated @RequestBody Solicitante solicitante) {
		return this.solicitanteService.actualizarSolicitante(idSolicitante, solicitante);
	}
	
	@DeleteMapping(value = "/solicitantes/{idSolicitante}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarSolicitante(@IdNumerico(maxRange = 65535) @PathVariable Integer idSolicitante) {
		this.solicitanteService.eliminarSolicitante(idSolicitante);
	}
	
}
