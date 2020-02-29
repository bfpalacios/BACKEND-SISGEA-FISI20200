package edu.taller.sisgea.seguridad.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ob.commons.spring.validation.validation.CaracterRequerido;
import ob.commons.spring.validation.validation.IdNumerico;
import ob.commons.spring.validation.validation.group.IRegistro;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PerfilUsuario {

	@IdNumerico(maxRange = 65535, groups = IRegistro.class)
	private Integer idPerfilUsuario;
	@CaracterRequerido(maxLength = 20)
	private String usuario;
	private String nombres;
	private String apellidos;
	@IdNumerico(maxRange = 65535, groups = IRegistro.class)
	private Integer idPerfil;
	private String descripcionPerfil;

}
