package edu.taller.sisgea.consultasgenerales.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EstadoEspacioAcademico {
	Integer id;
	Integer idAsignacion;
	String horario;
	Integer idEspacioAcademico;
	String descripcionEspacioAcademico;
	String idCurso;
	String descripcionCurso;
	String dia;
	String tipo;
	String idHorarioDetalle;
	String tipoHorario;
}
