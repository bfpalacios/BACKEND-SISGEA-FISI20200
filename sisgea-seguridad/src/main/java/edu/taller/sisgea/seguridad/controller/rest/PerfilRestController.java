package edu.taller.sisgea.seguridad.controller.rest;

import edu.taller.sisgea.seguridad.model.Perfil;
import ob.commons.spring.validation.validation.IdNumerico;
import ob.commons.spring.validation.validation.group.IRegistro;
import edu.taller.sisgea.seguridad.service.perfil.IPerfilService;
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
public class PerfilRestController {
	
	private final IPerfilService perfilService;
	
	public PerfilRestController(IPerfilService perfilService) {
		this.perfilService = perfilService;
	}
	
	@GetMapping(value = "/perfiles")
	public List<Perfil> buscarTodosPerfils() {
		return this.perfilService.buscarTodosPerfil();
	}
	
	@PostMapping(value = "/perfiles", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public Perfil registrarPerfil(@Validated({IRegistro.class, Default.class}) @RequestBody Perfil perfil) {
		System.out.println(perfil);
		this.perfilService.registrarPerfil(perfil);
		return this.perfilService.buscarPerfil(perfil.getIdPerfil());
	}
	
	@PutMapping(value = "/perfiles/{idPerfil}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Perfil actualizarPerfil(@IdNumerico(maxRange = 65535) @PathVariable Integer idPerfil,
	                             @Validated @RequestBody Perfil perfil) {
		System.out.println(perfil);
		this.perfilService.actualizarPerfil(idPerfil, perfil);
		return this.perfilService.buscarPerfil(perfil.getIdPerfil());
	}
	
	@DeleteMapping(value = "/perfiles/{idPerfil}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarPerfil(@IdNumerico(maxRange = 65535) @PathVariable Integer idPerfil) {
		System.out.println(idPerfil);
		this.perfilService.eliminarPerfil(idPerfil);
	}
	
}
