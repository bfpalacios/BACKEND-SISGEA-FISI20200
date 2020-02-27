package edu.taller.sisgea.consultasgenerales.model.criterio;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CriterioBusquedaEstadoEspacioAcademico {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date fecha;
	List<Integer> idsEspacioAcademico;
}
