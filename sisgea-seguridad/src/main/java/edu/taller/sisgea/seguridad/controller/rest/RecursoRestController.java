package edu.taller.sisgea.seguridad.controller.rest;

import edu.taller.sisgea.seguridad.model.Recurso;
import ob.commons.spring.validation.validation.group.IRegistro;
import edu.taller.sisgea.seguridad.service.recurso.IRecursoService;
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
public class RecursoRestController {
	
	private final IRecursoService recursoService;
	
	public RecursoRestController(IRecursoService recursoService) {
		this.recursoService = recursoService;
	}
	
	@GetMapping(value = "/recursos")
	public List<Recurso> buscarTodosRecursos() {
		return this.recursoService.buscarTodosRecurso();
	}
	
	@PostMapping(value = "/recursos", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public Recurso registrarRecurso(@Validated({IRegistro.class, Default.class}) @RequestBody Recurso recurso) {
		System.out.println(recurso);
		this.recursoService.registrarRecurso(recurso);
		return this.recursoService.buscarRecurso(recurso.getIdRecurso());
	}
	
	@PutMapping(value = "/recursos/{idRecurso}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Recurso actualizarRecurso(@PathVariable String idRecurso,
	                             @Validated @RequestBody Recurso recurso) {
		System.out.println(recurso);
		this.recursoService.actualizarRecurso(idRecurso, recurso);
		return this.recursoService.buscarRecurso(recurso.getIdRecurso());
	}
	
	@DeleteMapping(value = "/recursos/{idRecurso}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarRecurso(@PathVariable String idRecurso) {
		System.out.println(idRecurso);
		this.recursoService.eliminarRecurso(idRecurso);
	}
	
}
