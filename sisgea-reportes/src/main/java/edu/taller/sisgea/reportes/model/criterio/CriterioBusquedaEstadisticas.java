package edu.taller.sisgea.reportes.model.criterio;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CriterioBusquedaEstadisticas {
	String fechaRegistroInicio;
	String fechaRegistroFin;
	String fechaReservaInicio;
	String fechaReservaFin;
	List<String> pabellones;
	List<String> tipoEspacios;
	List<String> tiposSolicitudes;
	List<String> solicitantes;
}
