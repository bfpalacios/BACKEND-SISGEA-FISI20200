package edu.taller.sisgea.procesos.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ob.commons.spring.validation.validation.CaracterRequerido;
import ob.commons.spring.validation.validation.IdCadena;
import ob.commons.spring.validation.validation.group.IRegistro;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Plan {
	
	@IdCadena(minLength = 1, maxLength = 1, regexpPattern = "[a-zA-Z0-9]+", groups = IRegistro.class)
	private String idPlan;
	@CaracterRequerido(maxLength = 40)
	private String descripcionPlan;
	@CaracterRequerido(maxLength = 4)
	private String facultad;
	private String escuela;
	private String descripcionEscuela;
	private String especialidad;
	private String descripcionEspecialidad;

}
