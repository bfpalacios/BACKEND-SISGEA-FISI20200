package edu.taller.sisgea.seguridad.controller.rest;

import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import edu.taller.sisgea.seguridad.model.Autorizacion;
import edu.taller.sisgea.seguridad.model.Usuario;
import edu.taller.sisgea.seguridad.service.auth.IAuthService;

@Validated
@RestController
public class AuthRestController {
	
	private final IAuthService authService;
	
	public AuthRestController(IAuthService authService) {
		this.authService = authService;
	}
	
	@PostMapping(value = "/auth/login", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Autorizacion logIn(@RequestBody Usuario usuario) {
		return this.authService.logIn(usuario);
	}
}
