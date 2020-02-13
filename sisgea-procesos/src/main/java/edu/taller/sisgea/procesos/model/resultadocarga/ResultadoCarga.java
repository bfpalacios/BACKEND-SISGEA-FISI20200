package edu.taller.sisgea.procesos.model.resultadocarga;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ResultadoCarga {
	
	String nombreArchivo;
	Boolean exito;
	Integer numeroRegistros;
	
}
