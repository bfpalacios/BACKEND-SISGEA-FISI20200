package edu.taller.sisgea.procesos.controller.rest;

import edu.taller.sisgea.procesos.model.Docente;
import edu.taller.sisgea.procesos.service.docente.IDocenteService;
import edu.taller.sisgea.procesos.model.resultadocarga.ResultadoCarga;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Validated
@RestController
public class DocenteRestController {
	
	private final IDocenteService docenteService;
	
	public DocenteRestController(IDocenteService docenteService) {
		this.docenteService = docenteService;
	}
	
	@GetMapping(value = "/docente")
	public List<Docente> buscarTodosDocente() {
		return this.docenteService.buscarTodosDocente();
	}
	
	@PostMapping(value = "/docente/cargar")
	public List<ResultadoCarga> cargarArchivo(@RequestParam("file[]") List<MultipartFile> file){
		return this.docenteService.cargarArchivos(file);
	}
	
}
