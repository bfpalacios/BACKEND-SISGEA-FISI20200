package edu.taller.sisgea.seguridad.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ob.commons.spring.validation.validation.CaracterRequerido;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {
	
	@CaracterRequerido(maxLength = 20)
	private String usuario;
	@CaracterRequerido(maxLength = 45)
	private String contraseña;
	@CaracterRequerido(maxLength = 40)
	private String nombres;
	@CaracterRequerido(maxLength = 40)
	private String apellidos;

}
