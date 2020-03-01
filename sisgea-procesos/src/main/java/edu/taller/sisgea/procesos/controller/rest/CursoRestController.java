package edu.taller.sisgea.procesos.controller.rest;

import edu.taller.sisgea.procesos.model.Curso;
import edu.taller.sisgea.procesos.model.resultadocarga.ResultadoCarga;
import edu.taller.sisgea.procesos.service.curso.ICursoService;

import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Validated
@RestController
public class CursoRestController {

    private final ICursoService cursoService;

    public CursoRestController(ICursoService cursoService) {
        this.cursoService = cursoService;
    }

    @GetMapping(value = "/curso")
    public List<Curso> buscarTodosCursos() {
        return this.cursoService.buscarTodosCursos();
    }

    @PostMapping(value = "/curso/cargar")
	@ResponseStatus(code = HttpStatus.CREATED)
    public ResultadoCarga cargarArchivo(@RequestParam("file[]") List<MultipartFile> file){
        ResultadoCarga resultadoCarga = ResultadoCarga.builder().build();
		try {
	        this.cursoService.cargaArchivos(file);
        } catch (Exception e) {
			e.printStackTrace();
			resultadoCarga.setExito(false);
			resultadoCarga.setMensaje("Carga fallida");
			return resultadoCarga;
        }
		resultadoCarga.setExito(true);
		resultadoCarga.setMensaje("Registro Exitoso");
		return resultadoCarga;
    }

}
