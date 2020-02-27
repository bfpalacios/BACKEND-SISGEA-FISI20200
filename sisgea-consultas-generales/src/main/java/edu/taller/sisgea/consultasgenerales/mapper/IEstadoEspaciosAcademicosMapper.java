package edu.taller.sisgea.consultasgenerales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.taller.sisgea.consultasgenerales.model.EstadoEspacioAcademico;
import edu.taller.sisgea.consultasgenerales.model.criterio.CriterioBusquedaEstadoEspacioAcademico;

@Mapper
public interface IEstadoEspaciosAcademicosMapper {
	List<EstadoEspacioAcademico> buscarPorCriterio(CriterioBusquedaEstadoEspacioAcademico criterio);
}
