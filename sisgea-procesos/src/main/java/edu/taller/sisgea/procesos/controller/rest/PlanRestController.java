package edu.taller.sisgea.procesos.controller.rest;

import edu.taller.sisgea.procesos.model.Plan;
import edu.taller.sisgea.procesos.service.plan.IPlanService;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Validated
@RestController
public class PlanRestController {
	
	private final IPlanService planService;
	
	public PlanRestController(IPlanService planService) {
		this.planService = planService;
	}
	
	@GetMapping(value = "/planes")
	public List<Plan> buscarTodosPlanes() {
		return this.planService.buscarTodosPlan();
	}
	
	@PostMapping(value = "/planes/cargar")
	public ResponseEntity<?> cargarArchivo(@RequestParam("file[]") List<MultipartFile> file){
		try {
			this.planService.cargarArchivos(file);
        } catch (Exception e) {
			e.printStackTrace();
            return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body("Carga fallida");
        }
		return ResponseEntity.status(HttpStatus.OK).body("Registro exitoso");
	}
	
}
