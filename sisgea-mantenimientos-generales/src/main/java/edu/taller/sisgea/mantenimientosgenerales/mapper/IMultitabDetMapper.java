package edu.taller.sisgea.mantenimientosgenerales.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.mantenimientosgenerales.model.MultitabDet;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface IMultitabDetMapper extends IMantenibleMapper<MultitabDet> {

	Optional<MultitabDet> buscarMultiTabDet(int idMultitabCab, String idMultitabDet);
	
	List<MultitabDet> buscarMultitabsDetPorMultitabCab(int idMultitabCab);
}
