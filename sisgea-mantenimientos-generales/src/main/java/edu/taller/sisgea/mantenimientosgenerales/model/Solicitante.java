package edu.taller.sisgea.mantenimientosgenerales.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ob.commons.spring.validation.validation.CaracterRequerido;
import ob.commons.spring.validation.validation.IdNumerico;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Solicitante {
	
	private Integer idSolicitante;
	@CaracterRequerido(minLength = 8, maxLength = 8, regexpPattern = "[0-9]+")
	private String dni;
	@CaracterRequerido(maxLength = 40)
	private String nombres;
	@CaracterRequerido(maxLength = 40)
	private String apellidoPaterno;
	@CaracterRequerido(maxLength = 40)
	private String apellidoMaterno;
	@IdNumerico(maxRange = 999999999, minRange = 99999999)
	private Integer celular;
	private String email;
	private String tipoSolicitante;
	private String descripcionTipoSolicitante;
	private String base;
	private String descripcionBase;
	private String escuela;
	private String descripcionEscuela;

}
