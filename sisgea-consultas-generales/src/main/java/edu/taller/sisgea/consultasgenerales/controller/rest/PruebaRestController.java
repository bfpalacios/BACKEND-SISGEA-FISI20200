package edu.taller.sisgea.consultasgenerales.controller.rest;

import ob.commons.spring.validation.validation.IdCadena;
import ob.commons.spring.validation.validation.IdNumerico;
import edu.taller.sisgea.consultasgenerales.model.Prueba;
import edu.taller.sisgea.consultasgenerales.service.prueba.IPruebaService;
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
public class PruebaRestController {
	
	private final IPruebaService pruebaService;
	
	public PruebaRestController(IPruebaService pruebaService) {
		this.pruebaService = pruebaService;
	}
	
	@GetMapping(value = "/prueba-multitabs-dets")
	public List<Prueba> buscarTodosMultitabsDet() {
		return this.pruebaService.buscarTodosMultitabsDet();
	}
	
	@GetMapping(value = "/prueba-multitabs-cabs/{idMultitabCab}/multitabs-dets")
	public List<Prueba> buscarMultitabsDetPorMultitabCab(
			@IdNumerico(maxRange = 999) @PathVariable int idMultitabCab) {
		System.out.print(this.pruebaService.buscarMultitabsDetPorMultitabCab(idMultitabCab));
		return this.pruebaService.buscarMultitabsDetPorMultitabCab(idMultitabCab);
	}
	
	@PostMapping(value = "/prueba-multitabs-cabs/{idMultitabCab}/multitabs-dets",
	             consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public Prueba registrarPrueba(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab,
	                                        @Validated @RequestBody Prueba prueba) {
		return this.pruebaService.registrarPrueba(idMultitabCab, prueba);
	}
	
	@PutMapping(value = "/prueba-multitabs-cabs/{idMultitabCab}/multitabs-dets/{idMultitabDet}",
	            consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Prueba actualizarPrueba(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab,
	                                         @IdCadena(maxLength = 4, regexpPattern = "[a-zA-Z0-9]+") @PathVariable
			                                         String idMultitabDet,
	                                         @Validated @RequestBody Prueba prueba) {
		return this.pruebaService.actualizarPrueba(idMultitabCab, idMultitabDet, prueba);
	}
	
	@DeleteMapping(value = "/prueba-multitabs-cabs/{idMultitabCab}/multitabs-dets/{idMultitabDet}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarPrueba(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab,
	                                @IdCadena(maxLength = 4, regexpPattern = "[a-zA-Z0-9]+") @PathVariable
			                                String idMultitabDet) {
		this.pruebaService.eliminarPrueba(idMultitabCab, idMultitabDet);
	}
}
