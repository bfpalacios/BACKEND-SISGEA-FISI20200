package edu.taller.sisgea.consultasgenerales.model.criterio;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CriterioBusquedaEstadoEspacioAcademico {
	String horarioInicio;
	String horarioFin;
	List<Integer> idsEspacioAcademico;
}
