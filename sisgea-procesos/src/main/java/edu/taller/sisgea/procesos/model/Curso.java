package edu.taller.sisgea.procesos.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Curso {

    private String idPlan;
    private String idCurso;
    private Integer ciclo;
    private String especialidad;
    private String descripcion;
    private Double creditaje;
    private String tipo;
    private String grupo;

}
