package edu.taller.sisgea.consultasgenerales.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ob.commons.spring.validation.validation.CaracterNoRequerido;
import ob.commons.spring.validation.validation.CaracterRequerido;
import ob.commons.spring.validation.validation.IdCadena;
import ob.commons.spring.validation.validation.IdNumerico;
import ob.commons.spring.validation.validation.group.IRegistro;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Prueba {
	
	@IdNumerico(maxRange = 65535, groups = IRegistro.class)
	private Integer idMultitabCab;
	@IdCadena(maxLength = 4, regexpPattern = "[a-zA-Z0-9]+", groups = IRegistro.class)
	private String idMultitabDet;
	@CaracterRequerido(maxLength = 50)
	private String descripcionItem;
	@CaracterNoRequerido(maxLength = 10)
	private String abreviatura;
	private String descripcionMultitabCab;

}
