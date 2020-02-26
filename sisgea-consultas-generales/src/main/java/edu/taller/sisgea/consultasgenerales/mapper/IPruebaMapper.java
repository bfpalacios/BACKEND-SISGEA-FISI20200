package edu.taller.sisgea.consultasgenerales.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.consultasgenerales.model.Prueba;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface IPruebaMapper extends IMantenibleMapper<Prueba> {

	Optional<Prueba> buscarMultiTabDet(int idMultitabCab, String idMultitabDet);
	
	List<Prueba> buscarMultitabsDetPorMultitabCab(int idMultitabCab);
	
}
