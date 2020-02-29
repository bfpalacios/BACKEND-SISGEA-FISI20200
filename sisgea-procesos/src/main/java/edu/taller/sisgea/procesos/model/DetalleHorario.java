package edu.taller.sisgea.procesos.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DetalleHorario {

    private Integer idHorarioDetalle;
    private String idCurso;
    private String descCurso;
    private Integer seccion;
    private Integer idHorario;
    private String descripcionHorario;
    private String tipoHorario;
    private String descripcionTipoHorario;
    private String horarioInicio;
    private String horarioFin;

}
