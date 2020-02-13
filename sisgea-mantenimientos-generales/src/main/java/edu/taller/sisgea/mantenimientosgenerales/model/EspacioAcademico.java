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
public class EspacioAcademico {
	
	@IdNumerico(maxRange = 65535, groups = IRegistro.class)
	private Integer idEspacioAcademico;
	@CaracterRequerido(maxLength = 40)
	private String descripcionEspacioAcademico;
	private Integer aforo;
	private String pabellon;
	private String descripcionPabellon;
	private String tipoEspacio;
	private String descripcionTipoEspacio;
	private Boolean asignable;

}
