package edu.taller.sisgea.procesos.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Horario {

    private Integer idHorario;
    private String idCurso;
    private String descCurso;
    private Integer seccion;
    private String dia;
    private String horarioInicio;
    private String horarioFin;

}
