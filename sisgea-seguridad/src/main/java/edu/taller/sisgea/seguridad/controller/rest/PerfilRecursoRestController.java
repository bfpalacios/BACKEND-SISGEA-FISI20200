package edu.taller.sisgea.seguridad.controller.rest;

import edu.taller.sisgea.seguridad.model.PerfilRecurso;
import ob.commons.spring.validation.validation.IdNumerico;
import ob.commons.spring.validation.validation.group.IRegistro;
import edu.taller.sisgea.seguridad.service.perfilrecurso.IPerfilRecursoService;
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
public class PerfilRecursoRestController {
	
	private final IPerfilRecursoService perfilRecursoService;
	
	public PerfilRecursoRestController(IPerfilRecursoService perfilRecursoService) {
		this.perfilRecursoService = perfilRecursoService;
	}
	
	@GetMapping(value = "/perfilRecursos")
	public List<PerfilRecurso> buscarTodosPerfilRecursos() {
		return this.perfilRecursoService.buscarTodosPerfilRecurso();
	}

	@GetMapping(value = "/perfilRecursos/{idPerfil}")
	public List<PerfilRecurso> buscarRecursosPerfil(@PathVariable Integer idPerfil) {
		return this.perfilRecursoService.buscarRecursosPerfil(idPerfil);
	}
	
	@PostMapping(value = "/perfilRecursos", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public PerfilRecurso registrarPerfilRecurso(@Validated({IRegistro.class, Default.class}) @RequestBody PerfilRecurso perfilRecurso) {
		System.out.println(perfilRecurso);
		this.perfilRecursoService.registrarPerfilRecurso(perfilRecurso);
		return this.perfilRecursoService.buscarPerfilRecurso(perfilRecurso.getIdPerfilRecurso());
	}
	
	@PutMapping(value = "/perfilRecursos/{idPerfilRecurso}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public PerfilRecurso actualizarPerfilRecurso(@IdNumerico(maxRange = 65535) @PathVariable Integer idPerfilRecurso,
	                             @Validated @RequestBody PerfilRecurso perfilRecurso) {
		System.out.println(perfilRecurso);
		this.perfilRecursoService.actualizarPerfilRecurso(idPerfilRecurso, perfilRecurso);
		return this.perfilRecursoService.buscarPerfilRecurso(perfilRecurso.getIdPerfilRecurso());
	}
	
	@DeleteMapping(value = "/perfilRecursos/{idPerfilRecurso}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarPerfilRecurso(@IdNumerico(maxRange = 65535) @PathVariable Integer idPerfilRecurso) {
		System.out.println(idPerfilRecurso);
		this.perfilRecursoService.eliminarPerfilRecurso(idPerfilRecurso);
	}
	
}
