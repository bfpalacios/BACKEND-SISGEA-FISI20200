package edu.taller.sisgea.mantenimientosgenerales.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ob.commons.spring.validation.validation.CaracterRequerido;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MultitabCab {
	
	private Integer idMultitabCab;
	@CaracterRequerido(maxLength = 100)
	private String descripcionMultitabCab;

}
