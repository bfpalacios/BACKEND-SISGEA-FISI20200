package edu.taller.sisgea.procesos.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AsignacionEspacioAcademico {
	
	private String id;
	private Integer idAsignacion;
    private String periodo;
    private Integer ciclo;
    private String curso;
    private Integer seccion;
    private String idDocente;
    private String nombresDocente;
    private Integer tope;
    private Integer matriculados;
    private String turno;
    private String descripcionTurno;
    private String tipoHorario;
    private String descripcionTipoHorario;
    private String dia;
    private String descripcionDia;
    private String horarioInicio;
    private String horarioFin;
    private String espacio;

}
