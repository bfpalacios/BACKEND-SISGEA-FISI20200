package edu.taller.sisgea.procesos.controller.rest;

import edu.taller.sisgea.procesos.model.Programacion;
import edu.taller.sisgea.procesos.model.resultadocarga.ResultadoCarga;
import edu.taller.sisgea.procesos.service.programacion.IProgramacionService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Validated
@RestController
public class ProgramacionRestController {
	
	private final IProgramacionService programacionService;
	
	public ProgramacionRestController(IProgramacionService programacionService) {
		this.programacionService = programacionService;
	}
	
	@GetMapping(value = "/programaciones")
	public List<Programacion> buscarTodosProgramaciones() {
		return this.programacionService.buscarTodosProgramacion();
	}
	
	@PostMapping(value = "/programaciones/cargar")
	public List<ResultadoCarga> cargarArchivo(@RequestParam("file[]") List<MultipartFile> file){
		return this.programacionService.cargarArchivos(file);
	}
	
	
}
