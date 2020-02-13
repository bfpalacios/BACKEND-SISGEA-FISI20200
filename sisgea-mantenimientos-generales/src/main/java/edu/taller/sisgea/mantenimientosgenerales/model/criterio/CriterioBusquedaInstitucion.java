package edu.taller.sisgea.mantenimientosgenerales.model.criterio;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CriterioBusquedaInstitucion {
	//buscarPorCriterios en MAE_INSTITUCION
	private Integer idInstitucionOperador;
	private String operador; // 'LIKE' = igual , 'NOT LIKE' = no igual
	//buscarPorInstituciones en MAE_BIN
	private List<Integer> idsInstitucion;
	
}
