package edu.taller.sisgea.seguridad.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {
	private String usuario;
	private String contrasenia;
	private String nombres;
	private String apellidos;

}
