package edu.taller.sisgea.consultasgenerales.controller.rest;

import java.util.List;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.taller.sisgea.consultasgenerales.model.EstadoEspacioAcademico;
import edu.taller.sisgea.consultasgenerales.model.criterio.CriterioBusquedaEstadoEspacioAcademico;
import edu.taller.sisgea.consultasgenerales.service.IEstadoEspaciosAcademicosService;

@Validated
@RestController
public class EstadoEspaciosAcademicosRestController {
	
	private final IEstadoEspaciosAcademicosService estadoEspaciosAcademicosService;
	
	public EstadoEspaciosAcademicosRestController(IEstadoEspaciosAcademicosService estadoEspaciosAcademicosService) {
		this.estadoEspaciosAcademicosService = estadoEspaciosAcademicosService;
	}
	
	@GetMapping("/estado-espacios-academicos")
    public List<EstadoEspacioAcademico> buscarPorCriterio(CriterioBusquedaEstadoEspacioAcademico criterio) {
        return this.estadoEspaciosAcademicosService.buscarPorCriterio(criterio);
    }
}
