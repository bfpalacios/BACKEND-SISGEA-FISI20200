package edu.taller.sisgea.mantenimientosgenerales.model;

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
public class MultitabCab {
	
	@IdNumerico(maxRange = 65535, groups = IRegistro.class)
	private Integer idMultitabCab;
	@CaracterRequerido(maxLength = 100)
	private String descripcionMultitabCab;

}
