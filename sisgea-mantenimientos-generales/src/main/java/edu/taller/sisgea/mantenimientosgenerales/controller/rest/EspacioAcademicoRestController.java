package edu.taller.sisgea.mantenimientosgenerales.controller.rest;

import edu.taller.sisgea.mantenimientosgenerales.model.EspacioAcademico;
import ob.commons.spring.validation.validation.IdNumerico;
import ob.commons.spring.validation.validation.group.IRegistro;
import edu.taller.sisgea.mantenimientosgenerales.service.espacioacademico.IEspacioAcademicoService;
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
public class EspacioAcademicoRestController {
	
	private final IEspacioAcademicoService espacioAcademicoService;
	
	public EspacioAcademicoRestController(IEspacioAcademicoService espacioAcademicoService) {
		this.espacioAcademicoService = espacioAcademicoService;
	}
	
	@GetMapping(value = "/espacios-academicos")
	public List<EspacioAcademico> buscarTodosEspacioAcademicos() {
		return this.espacioAcademicoService.buscarTodosEspacioAcademico();
	}
	
	@PostMapping(value = "/espacios-academicos", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public EspacioAcademico registrarEspacioAcademico(@Validated({IRegistro.class, Default.class}) @RequestBody EspacioAcademico espacioAcademico) {
		System.out.println(espacioAcademico);
		this.espacioAcademicoService.registrarEspacioAcademico(espacioAcademico);
		return this.espacioAcademicoService.buscarEspacioAcademico(espacioAcademico.getIdEspacioAcademico());
	}
	
	@PutMapping(value = "/espacios-academicos/{idEspacioAcademico}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public EspacioAcademico actualizarEspacioAcademico(@IdNumerico(maxRange = 65535) @PathVariable Integer idEspacioAcademico,
	                             @Validated @RequestBody EspacioAcademico espacioAcademico) {
		System.out.println(espacioAcademico);
		this.espacioAcademicoService.actualizarEspacioAcademico(idEspacioAcademico, espacioAcademico);
		return this.espacioAcademicoService.buscarEspacioAcademico(espacioAcademico.getIdEspacioAcademico());
	}
	
	@DeleteMapping(value = "/espacios-academicos/{idEspacioAcademico}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarEspacioAcademico(@IdNumerico(maxRange = 65535) @PathVariable Integer idEspacioAcademico) {
		System.out.println(idEspacioAcademico);
		this.espacioAcademicoService.eliminarEspacioAcademico(idEspacioAcademico);
	}
	
}
