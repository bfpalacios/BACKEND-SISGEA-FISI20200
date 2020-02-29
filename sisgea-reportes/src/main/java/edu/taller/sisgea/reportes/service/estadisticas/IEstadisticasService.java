package edu.taller.sisgea.reportes.service.estadisticas;

import java.util.List;

import edu.taller.sisgea.reportes.model.ReporteSolicitudes;
import edu.taller.sisgea.reportes.model.criterio.CriterioBusquedaEstadisticas;

public interface IEstadisticasService {
	List<ReporteSolicitudes> buscarPorCriterio(CriterioBusquedaEstadisticas criterio);
}
