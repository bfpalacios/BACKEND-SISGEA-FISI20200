package edu.taller.sisgea.procesos.controller.rest;

import edu.taller.sisgea.procesos.model.DetalleHorario;
import edu.taller.sisgea.procesos.model.resultadocarga.ResultadoCarga;
import edu.taller.sisgea.procesos.service.detallehorario.IDetalleHorarioService;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Validated
@RestController
public class DetalleHorarioRestController {

    private final IDetalleHorarioService detalleHorarioService;

    public DetalleHorarioRestController(IDetalleHorarioService detalleHorarioService) {
        this.detalleHorarioService = detalleHorarioService;
    }

    @GetMapping(value = "/detalle-horario")
    public List<DetalleHorario> buscarTodosDetalleHorario() {
        return this.detalleHorarioService.buscarTodosDetalleHorario();
    }

    @PostMapping(value = "/detalle-horario/cargar")
    public List<ResultadoCarga> cargarArchivo(@RequestParam("file[]") List<MultipartFile> file){
        return this.detalleHorarioService.cargarArchivos(file);
    }

}
