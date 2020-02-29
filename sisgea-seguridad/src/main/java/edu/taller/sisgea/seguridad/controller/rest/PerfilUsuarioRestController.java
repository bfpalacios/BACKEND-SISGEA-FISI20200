package edu.taller.sisgea.seguridad.controller.rest;

import edu.taller.sisgea.seguridad.model.PerfilUsuario;
import ob.commons.spring.validation.validation.IdNumerico;
import ob.commons.spring.validation.validation.group.IRegistro;
import edu.taller.sisgea.seguridad.service.perfilusuario.IPerfilUsuarioService;
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
public class PerfilUsuarioRestController {
	
	private final IPerfilUsuarioService perfilUsuarioService;
	
	public PerfilUsuarioRestController(IPerfilUsuarioService perfilUsuarioService) {
		this.perfilUsuarioService = perfilUsuarioService;
	}
	
	@GetMapping(value = "/perfil-usuario")
	public List<PerfilUsuario> buscarTodosPerfilUsuarios() {
		return this.perfilUsuarioService.buscarTodosPerfilUsuario();
	}

	@GetMapping(value = "/perfil-usuario/{usuario}")
	public List<PerfilUsuario> buscarTodosPerfilUsuarios(@PathVariable String usuario) {
		return this.perfilUsuarioService.buscarPerfilesUsuario(usuario);
	}
	
	@PostMapping(value = "/perfil-usuario", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public PerfilUsuario registrarPerfilUsuario(@Validated({IRegistro.class, Default.class}) @RequestBody PerfilUsuario perfilUsuario) {
		System.out.println(perfilUsuario);
		this.perfilUsuarioService.registrarPerfilUsuario(perfilUsuario);
		return this.perfilUsuarioService.buscarPerfilUsuario(perfilUsuario.getIdPerfilUsuario());
	}
	
	@PutMapping(value = "/perfil-usuario/{idPerfilUsuario}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public PerfilUsuario actualizarPerfilUsuario(@IdNumerico(maxRange = 65535) @PathVariable Integer idPerfilUsuario,
	                             @Validated @RequestBody PerfilUsuario perfilUsuario) {
		System.out.println(perfilUsuario);
		this.perfilUsuarioService.actualizarPerfilUsuario(idPerfilUsuario, perfilUsuario);
		return this.perfilUsuarioService.buscarPerfilUsuario(perfilUsuario.getIdPerfilUsuario());
	}
	
	@DeleteMapping(value = "/perfil-usuario/{idPerfilUsuario}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarPerfilUsuario(@IdNumerico(maxRange = 65535) @PathVariable Integer idPerfilUsuario) {
		System.out.println(idPerfilUsuario);
		this.perfilUsuarioService.eliminarPerfilUsuario(idPerfilUsuario);
	}
	
}
