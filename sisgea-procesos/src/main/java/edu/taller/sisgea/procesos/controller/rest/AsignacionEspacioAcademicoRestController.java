package edu.taller.sisgea.procesos.controller.rest;

import edu.taller.sisgea.procesos.model.AsignacionEspacioAcademico;
import edu.taller.sisgea.procesos.model.AsignacionManualEspacioAcademico;
import edu.taller.sisgea.procesos.service.asignacionespacioacademico.IAsignacionEspacioAcademicoService;
import edu.taller.sisgea.procesos.service.asignacionmanualespacioacademico.IAsignacionManualEspacioAcademicoService;
import ob.commons.spring.validation.validation.IdNumerico;

import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Validated
@RestController
public class AsignacionEspacioAcademicoRestController {
	
	private final IAsignacionEspacioAcademicoService asignacionEspacioAcademicoService;
	private final IAsignacionManualEspacioAcademicoService asignacionManualEspacioAcademicoService;
	
	public AsignacionEspacioAcademicoRestController(IAsignacionEspacioAcademicoService asignacionEspacioAcademicoService,IAsignacionManualEspacioAcademicoService asignacionManualEspacioAcademicoService) {
		this.asignacionEspacioAcademicoService = asignacionEspacioAcademicoService;
		this.asignacionManualEspacioAcademicoService = asignacionManualEspacioAcademicoService;
	}
	
	@GetMapping(value = "/asignacion-espacios")
	public List<AsignacionEspacioAcademico> buscarTodosAsignacionEspacioAcademico() {
		return this.asignacionEspacioAcademicoService.buscarTodosAsignacionEspacioAcademico();
	}

	@PostMapping(value = "/asignacion-espacios/procesar")
	public List<AsignacionEspacioAcademico> asignacionEspaciosAcademicos(){
		this.asignacionEspacioAcademicoService.ejecutarProcedimientoAsignacionEspacioAcademico();
		return this.asignacionEspacioAcademicoService.buscarTodosAsignacionEspacioAcademico();
	}
	
	@PutMapping(value = "/asignacion-espacios/{idAsignacion}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public AsignacionManualEspacioAcademico actualizarEspacioAcademico(@IdNumerico(maxRange = 65535) @PathVariable Integer idAsignacion,
	                             @Validated @RequestBody AsignacionManualEspacioAcademico asignacionManualEspacioAcademico) {
		this.asignacionManualEspacioAcademicoService.actualizarAsignacionManualEspacioAcademico(idAsignacion, asignacionManualEspacioAcademico);
		return this.asignacionManualEspacioAcademicoService.buscarAsignacionManualEspacioAcademico(asignacionManualEspacioAcademico.getIdAsignacion());
	}

}
