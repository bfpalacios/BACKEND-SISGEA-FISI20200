package edu.taller.sisgea.mantenimientosgenerales.service.multitabcab;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.mantenimientosgenerales.model.MultitabCab;

import java.util.List;

public interface IMultitabCabService extends IMantenibleService<MultitabCab> {

	List<MultitabCab> buscarTodosMultitabsCab();
	
	MultitabCab registrarMultitabCab(MultitabCab multitabCab);
	
	MultitabCab actualizarMultitabCab(int idMultitabCab, MultitabCab multitabCab);
	
	void eliminarMultitabCab(int idMultitabCab);
}
