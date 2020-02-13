package edu.taller.sisgea.procesos.controller.rest;

import edu.taller.sisgea.procesos.model.Horario;
import edu.taller.sisgea.procesos.model.resultadocarga.ResultadoCarga;
import edu.taller.sisgea.procesos.service.horario.IHorarioService;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Validated
@RestController
public class HorarioRestController {

    private final IHorarioService horarioService;

    public HorarioRestController(IHorarioService horarioService) {
        this.horarioService = horarioService;
    }

    @GetMapping(value = "/horario")
    public List<Horario> buscarTodosDetalleHorario() {
        return this.horarioService.buscarTodosHorario();
    }

    @PostMapping(value = "/horario/cargar")
    public List<ResultadoCarga> cargarArchivo(@RequestParam("file[]") List<MultipartFile> file){
        return this.horarioService.cargarArchivos(file);
    }

}
