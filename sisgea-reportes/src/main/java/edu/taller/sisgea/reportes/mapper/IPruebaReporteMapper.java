package edu.taller.sisgea.reportes.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.reportes.model.PruebaReporte;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface IPruebaReporteMapper extends IMantenibleMapper<PruebaReporte> {

	Optional<PruebaReporte> buscarMultiTabDet(int idMultitabCab, String idMultitabDet);
	
	List<PruebaReporte> buscarMultitabsDetPorMultitabCab(int idMultitabCab);
	
}
