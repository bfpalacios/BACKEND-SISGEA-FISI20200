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
public class Recurso {
	
	@CaracterRequerido(maxLength = 20)
	private String idRecurso;
	@CaracterRequerido(maxLength = 40)
	private String descripcionRecurso;
	private String idCategoriaRecurso;
	private String descripcionCategoriaRecurso;

}
