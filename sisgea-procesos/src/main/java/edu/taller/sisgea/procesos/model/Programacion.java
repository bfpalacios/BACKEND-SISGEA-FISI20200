package edu.taller.sisgea.procesos.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ob.commons.spring.validation.validation.IdCadena;
import ob.commons.spring.validation.validation.group.IRegistro;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Programacion {
	
	@IdCadena(minLength = 1, maxLength = 1, regexpPattern = "[a-zA-Z0-9]+", groups = IRegistro.class)
	private String idCurso;
	private String descripcionCurso;
	private Integer seccion;
	private String idDocente;
	private String nombresDocente;
	private Integer tope;
	private Integer matriculados;
	private String turno;
	private String descripcionTurno;

	private String aula;

}
