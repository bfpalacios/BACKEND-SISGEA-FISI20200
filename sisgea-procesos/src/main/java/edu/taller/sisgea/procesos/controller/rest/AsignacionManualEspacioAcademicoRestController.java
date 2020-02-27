package edu.taller.sisgea.procesos.controller.rest;

import edu.taller.sisgea.procesos.model.AsignacionManualEspacioAcademico;
import edu.taller.sisgea.procesos.service.asignacionmanualespacioacademico.IAsignacionManualEspacioAcademicoService;
import ob.commons.spring.validation.validation.IdNumerico;

import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Validated
@RestController
public class AsignacionManualEspacioAcademicoRestController {
	
	private final IAsignacionManualEspacioAcademicoService asignacionEspacioAcademicoService;
	
	public AsignacionManualEspacioAcademicoRestController(IAsignacionManualEspacioAcademicoService asignacionEspacioAcademicoService) {
		this.asignacionEspacioAcademicoService = asignacionEspacioAcademicoService;
	}
	
	@GetMapping(value = "/asignacion-espacios-manual")
	public List<AsignacionManualEspacioAcademico> buscarTodosAsignacionManualEspacioAcademico() {
		return this.asignacionEspacioAcademicoService.buscarTodosAsignacionManualEspacioAcademico();
	}
	
	@PutMapping(value = "/asignacion-espacios-manual/{idAsignacion}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public AsignacionManualEspacioAcademico actualizarEspacioAcademico(@IdNumerico(maxRange = 65535) @PathVariable Integer idAsignacion,
	                             @Validated @RequestBody AsignacionManualEspacioAcademico asignacionManualEspacioAcademico) {
		this.asignacionEspacioAcademicoService.actualizarAsignacionManualEspacioAcademico(idAsignacion, asignacionManualEspacioAcademico);
		return this.asignacionEspacioAcademicoService.buscarAsignacionManualEspacioAcademico(asignacionManualEspacioAcademico.getIdAsignacion());
	}
	
}
