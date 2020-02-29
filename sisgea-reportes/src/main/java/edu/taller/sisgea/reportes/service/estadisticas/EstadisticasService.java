package edu.taller.sisgea.reportes.service.estadisticas;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import edu.taller.sisgea.reportes.mapper.IEstadisticasMapper;
import edu.taller.sisgea.reportes.model.ReporteSolicitudes;
import edu.taller.sisgea.reportes.model.criterio.CriterioBusquedaEstadisticas;


@Service
public class EstadisticasService implements IEstadisticasService{
	
	private final IEstadisticasMapper estadisticasMapper;
	
	public EstadisticasService(IEstadisticasMapper estadisticasMapper) {
		this.estadisticasMapper = estadisticasMapper;
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<ReporteSolicitudes> buscarPorCriterio(CriterioBusquedaEstadisticas criterio) {
		return this.estadisticasMapper.buscarPorCriterio(criterio);
	}
}
