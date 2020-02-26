package edu.taller.sisgea.consultasgenerales.service;

import java.util.List;

import edu.taller.sisgea.consultasgenerales.model.EstadoEspacioAcademico;
import edu.taller.sisgea.consultasgenerales.model.criterio.CriterioBusquedaEstadoEspacioAcademico;

public interface IEstadoEspaciosAcademicosService {
	List<EstadoEspacioAcademico> buscarPorCriterio(CriterioBusquedaEstadoEspacioAcademico criterio);
}
