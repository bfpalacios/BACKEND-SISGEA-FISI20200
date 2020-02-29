package edu.taller.sisgea.seguridad.controller.rest;

import edu.taller.sisgea.seguridad.model.Usuario;
import ob.commons.spring.validation.validation.group.IRegistro;
import edu.taller.sisgea.seguridad.service.usuario.IUsuarioService;
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
public class UsuarioRestController {
	
	private final IUsuarioService usuarioService;
	
	public UsuarioRestController(IUsuarioService usuarioService) {
		this.usuarioService = usuarioService;
	}
	
	@GetMapping(value = "/usuarios")
	public List<Usuario> buscarTodosUsuarios() {
		return this.usuarioService.buscarTodosUsuario();
	}
	
	@PostMapping(value = "/usuarios", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public Usuario registrarUsuario(@Validated({IRegistro.class, Default.class}) @RequestBody Usuario usuario) {
		System.out.println(usuario);
		this.usuarioService.registrarUsuario(usuario);
		return this.usuarioService.buscarUsuario(usuario.getUsuario());
	}
	
	@PutMapping(value = "/usuarios/{usuarioN}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Usuario actualizarUsuario(@PathVariable String usuarioN,
	                             @Validated @RequestBody Usuario usuario) {
		System.out.println(usuario);
		this.usuarioService.actualizarUsuario(usuarioN, usuario);
		return this.usuarioService.buscarUsuario(usuario.getUsuario());
	}
	
	@DeleteMapping(value = "/usuarios/{usuario}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarUsuario(@PathVariable String usuario) {
		System.out.println(usuario);
		this.usuarioService.eliminarUsuario(usuario);
	}
	
}
