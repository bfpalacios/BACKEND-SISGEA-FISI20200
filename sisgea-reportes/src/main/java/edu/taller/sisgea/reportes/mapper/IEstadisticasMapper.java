package edu.taller.sisgea.reportes.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.taller.sisgea.reportes.model.ReporteSolicitudes;
import edu.taller.sisgea.reportes.model.criterio.CriterioBusquedaEstadisticas;

@Mapper
public interface IEstadisticasMapper {
	List<ReporteSolicitudes> buscarPorCriterio(CriterioBusquedaEstadisticas criterio);
}