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
public class Docente {
	
	@IdCadena(minLength = 1, maxLength = 20, regexpPattern = "[a-zA-Z0-9]+", groups = IRegistro.class)
	private String idDocente;
	@CaracterRequerido(maxLength = 40)
	private String nombres;
	@CaracterRequerido(maxLength = 40)
	private String apellidos;
	private String tipo;
}
