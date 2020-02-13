package edu.taller.sisgea.mantenimientosgenerales.controller.rest;

import ob.commons.spring.validation.validation.IdCadena;
import ob.commons.spring.validation.validation.IdNumerico;
import edu.taller.sisgea.mantenimientosgenerales.model.MultitabDet;
import edu.taller.sisgea.mantenimientosgenerales.service.multitabdet.IMultitabDetService;
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
public class MultitabDetRestController {
	
	private final IMultitabDetService multitabDetService;
	
	public MultitabDetRestController(IMultitabDetService multitabDetService) {
		this.multitabDetService = multitabDetService;
	}
	
	@GetMapping(value = "/multitabs-dets")
	public List<MultitabDet> buscarTodosMultitabsDet() {
		return this.multitabDetService.buscarTodosMultitabsDet();
	}
	
	@GetMapping(value = "/multitabs-cabs/{idMultitabCab}/multitabs-dets")
	public List<MultitabDet> buscarMultitabsDetPorMultitabCab(
			@IdNumerico(maxRange = 999) @PathVariable int idMultitabCab) {
		System.out.print(this.multitabDetService.buscarMultitabsDetPorMultitabCab(idMultitabCab));
		return this.multitabDetService.buscarMultitabsDetPorMultitabCab(idMultitabCab);
	}
	
	@PostMapping(value = "/multitabs-cabs/{idMultitabCab}/multitabs-dets",
	             consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public MultitabDet registrarMultitabDet(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab,
	                                        @Validated @RequestBody MultitabDet multitabDet) {
		return this.multitabDetService.registrarMultitabDet(idMultitabCab, multitabDet);
	}
	
	@PutMapping(value = "/multitabs-cabs/{idMultitabCab}/multitabs-dets/{idMultitabDet}",
	            consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public MultitabDet actualizarMultitabDet(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab,
	                                         @IdCadena(maxLength = 4, regexpPattern = "[a-zA-Z0-9]+") @PathVariable
			                                         String idMultitabDet,
	                                         @Validated @RequestBody MultitabDet multitabDet) {
		return this.multitabDetService.actualizarMultitabDet(idMultitabCab, idMultitabDet, multitabDet);
	}
	
	@DeleteMapping(value = "/multitabs-cabs/{idMultitabCab}/multitabs-dets/{idMultitabDet}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarMultitabDet(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab,
	                                @IdCadena(maxLength = 4, regexpPattern = "[a-zA-Z0-9]+") @PathVariable
			                                String idMultitabDet) {
		this.multitabDetService.eliminarMultitabDet(idMultitabCab, idMultitabDet);
	}
}
