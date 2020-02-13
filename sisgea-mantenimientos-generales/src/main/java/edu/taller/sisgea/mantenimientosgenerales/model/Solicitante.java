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
public class Solicitante {
	
	private Integer idSolicitante;
	private Integer dni;
	@CaracterRequerido(maxLength = 40)
	private String nombres;
	@CaracterRequerido(maxLength = 40)
	private String apellidoPaterno;
	@CaracterRequerido(maxLength = 40)
	private String apellidoMaterno;
	private Integer celular;
	private String email;
	private String tipoSolicitante;
	private String descripcionTipoSolicitante;
	private Integer base;
	private String escuela;
	private String descripcionEscuela;

}
