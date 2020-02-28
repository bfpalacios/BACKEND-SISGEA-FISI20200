package edu.taller.sisgea.procesos.controller.rest;

import edu.taller.sisgea.procesos.model.AsignacionEspacioAcademico;
import edu.taller.sisgea.procesos.service.asignacionespacioacademico.IAsignacionEspacioAcademicoService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Validated
@RestController
public class AsignacionEspacioAcademicoRestController {
	
	private final IAsignacionEspacioAcademicoService asignacionEspacioAcademicoService;
	
	public AsignacionEspacioAcademicoRestController(IAsignacionEspacioAcademicoService asignacionEspacioAcademicoService) {
		this.asignacionEspacioAcademicoService = asignacionEspacioAcademicoService;
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

}
