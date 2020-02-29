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
public class Perfil {
	
	private Integer idPerfil;
	@CaracterRequerido(maxLength = 40)
	private String descripcionPerfil;

}
