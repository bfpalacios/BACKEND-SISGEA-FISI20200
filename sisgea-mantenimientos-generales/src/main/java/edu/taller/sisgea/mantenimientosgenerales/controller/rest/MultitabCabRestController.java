package edu.taller.sisgea.mantenimientosgenerales.controller.rest;

import ob.commons.spring.validation.validation.IdNumerico;
import ob.commons.spring.validation.validation.group.IRegistro;
import edu.taller.sisgea.mantenimientosgenerales.model.MultitabCab;
import edu.taller.sisgea.mantenimientosgenerales.service.multitabcab.IMultitabCabService;
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
public class MultitabCabRestController {
	
	private final IMultitabCabService multitabCabService;
	
	public MultitabCabRestController(IMultitabCabService multitabCabService) {
		this.multitabCabService = multitabCabService;
	}
	
	@GetMapping(value = "/multitabs-cabs")
	public List<MultitabCab> buscarTodosMultitabsCab() {
		return this.multitabCabService.buscarTodosMultitabsCab();
	}
	
	@PostMapping(value = "/multitabs-cabs", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseStatus(code = HttpStatus.CREATED)
	public MultitabCab registrarMultitabCab(
			@Validated({IRegistro.class, Default.class}) @RequestBody MultitabCab multitabCab) {
		return this.multitabCabService.registrarMultitabCab(multitabCab);
	}
	
	@PutMapping(value = "/multitabs-cabs/{idMultitabCab}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public MultitabCab actualizarMultitabCab(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab,
	                                         @Validated @RequestBody MultitabCab multitabCab) {
		return this.multitabCabService.actualizarMultitabCab(idMultitabCab, multitabCab);
	}
	
	@DeleteMapping("/multitabs-cabs/{idMultitabCab}")
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	public void eliminarMultitabCab(@IdNumerico(maxRange = 65535) @PathVariable int idMultitabCab) {
		this.multitabCabService.eliminarMultitabCab(idMultitabCab);
	}
	
}
