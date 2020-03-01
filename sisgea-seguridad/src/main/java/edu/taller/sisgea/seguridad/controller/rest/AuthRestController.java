package edu.taller.sisgea.seguridad.controller.rest;

import java.util.List;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping(value = "/auth/login")
	public Autorizacion logIn(Usuario usuario) {
		return this.authService.logIn(usuario);
	}
}
