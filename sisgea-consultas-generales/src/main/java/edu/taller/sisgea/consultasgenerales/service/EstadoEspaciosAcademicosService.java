package edu.taller.sisgea.consultasgenerales.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import edu.taller.sisgea.consultasgenerales.mapper.IEstadoEspaciosAcademicosMapper;
import edu.taller.sisgea.consultasgenerales.model.EstadoEspacioAcademico;
import edu.taller.sisgea.consultasgenerales.model.criterio.CriterioBusquedaEstadoEspacioAcademico;


@Service
public class EstadoEspaciosAcademicosService implements IEstadoEspaciosAcademicosService{
	
	private final IEstadoEspaciosAcademicosMapper estadoEspaciosAcademicosMapper;
	
	public EstadoEspaciosAcademicosService(IEstadoEspaciosAcademicosMapper estadoEspaciosAcademicosMapper) {
		this.estadoEspaciosAcademicosMapper = estadoEspaciosAcademicosMapper;
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<EstadoEspacioAcademico> buscarPorCriterio(CriterioBusquedaEstadoEspacioAcademico criterio) {
		return this.estadoEspaciosAcademicosMapper.buscarPorCriterio(criterio);
	}

}
