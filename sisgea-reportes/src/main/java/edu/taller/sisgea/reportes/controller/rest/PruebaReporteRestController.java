package edu.taller.sisgea.reportes.controller.rest;

import ob.commons.spring.validation.validation.IdCadena;
import ob.commons.spring.validation.validation.IdNumerico;
import edu.taller.sisgea.reportes.model.PruebaReporte;
import edu.taller.sisgea.reportes.service.pruebareporte.IPruebaReporteService;
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

import java.util.List;

@Validated
@RestController
public class PruebaReporteRestController {
	
	private final IPruebaReporteService pruebaReporteService;
	
	public PruebaReporteRestController(IPruebaReporteService pruebaReporteService) {
		this.pruebaReporteService = pruebaReporteService;
	}
	
	@GetMapping(value = "/prueba-reporte-multitabs-dets")
	public List<PruebaReporte> buscarTodosMultitabsDet() {
		return this.pruebaReporteService.buscarTodosMultitabsDet();
	}
	
	@GetMapping(value = "/prueba-reporte-multitabs-cabs/{idMultitabCab}/multitabs-dets")
	public List<PruebaReporte> buscarMultitabsDetPorMultitabCab(
			@IdNumerico(maxRange = 999) @PathVariable int idMultitabCab) {
		System.out.print(this.pruebaReporteService.buscarMultitabsDetPorMultitabCab(idMultitabCab));
		return this.pruebaReporteService.buscarMultitabsDetPorMultitabCab(idMultitabCab);
	}
	
	@PostMapping(value = "/prueba-reporte-multitabs-cabs/{idMultitabCab}/multitabs-dets",
	             consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public PruebaReporte registrarPruebaReporte(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab,
	                                        @Validated @RequestBody PruebaReporte pruebaReporte) {
		return this.pruebaReporteService.registrarPruebaReporte(idMultitabCab, pruebaReporte);
	}
	
	@PutMapping(value = "/prueba-reporte-multitabs-cabs/{idMultitabCab}/multitabs-dets/{idMultitabDet}",
	            consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public PruebaReporte actualizarPruebaReporte(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab,
	                                         @IdCadena(maxLength = 4, regexpPattern = "[a-zA-Z0-9]+") @PathVariable
			                                         String idMultitabDet,
	                                         @Validated @RequestBody PruebaReporte pruebaReporte) {
		return this.pruebaReporteService.actualizarPruebaReporte(idMultitabCab, idMultitabDet, pruebaReporte);
	}
	
	@DeleteMapping(value = "/prueba-reporte-multitabs-cabs/{idMultitabCab}/multitabs-dets/{idMultitabDet}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarPruebaReporte(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab,
	                                @IdCadena(maxLength = 4, regexpPattern = "[a-zA-Z0-9]+") @PathVariable
			                                String idMultitabDet) {
		this.pruebaReporteService.eliminarPruebaReporte(idMultitabCab, idMultitabDet);
	}
}
