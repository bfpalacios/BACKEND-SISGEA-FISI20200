package edu.taller.sisgea.mantenimientosgenerales.service.multitabdet;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.mantenimientosgenerales.model.MultitabDet;

import java.util.List;

public interface IMultitabDetService extends IMantenibleService<MultitabDet> {
	
	List<MultitabDet> buscarTodosMultitabsDet();
	
	MultitabDet buscarMultitabDet(int idMultitabCab, String idMultitabDet);
	
	List<MultitabDet> buscarMultitabsDetPorMultitabCab(int idMultitabCab);
	
	MultitabDet registrarMultitabDet(int idMultitabCab, MultitabDet multitabDet);
	
	MultitabDet actualizarMultitabDet(int idMultitabCab, String idMultitabDet, MultitabDet multitabDet);
	
	void eliminarMultitabDet(int idMultitabCab, String idMultitabDet);
}
