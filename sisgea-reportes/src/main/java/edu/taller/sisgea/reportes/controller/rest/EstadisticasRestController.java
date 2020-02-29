package edu.taller.sisgea.reportes.controller.rest;

import java.util.List;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.taller.sisgea.reportes.model.ReporteSolicitudes;
import edu.taller.sisgea.reportes.model.criterio.CriterioBusquedaEstadisticas;
import edu.taller.sisgea.reportes.service.estadisticas.IEstadisticasService;

@Validated
@RestController
public class EstadisticasRestController {
	
	private final IEstadisticasService estadisticasService;
	
	public EstadisticasRestController(IEstadisticasService estadisticasService) {
		this.estadisticasService = estadisticasService;
	}
	
	@GetMapping("/estadisticas")
    public List<ReporteSolicitudes> buscarPorCriterio(CriterioBusquedaEstadisticas criterio) {
        return this.estadisticasService.buscarPorCriterio(criterio);
    }
}
