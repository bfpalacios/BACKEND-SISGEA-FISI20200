package edu.taller.sisgea.reportes.service.pruebareporte;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.reportes.model.PruebaReporte;

import java.util.List;

public interface IPruebaReporteService extends IMantenibleService<PruebaReporte> {
	
	List<PruebaReporte> buscarTodosMultitabsDet();
	
	PruebaReporte buscarPruebaReporte(int idMultitabCab, String idMultitabDet);
	
	List<PruebaReporte> buscarMultitabsDetPorMultitabCab(int idMultitabCab);
	
	PruebaReporte registrarPruebaReporte(int idMultitabCab, PruebaReporte multitabDet);
	
	PruebaReporte actualizarPruebaReporte(int idMultitabCab, String idMultitabDet, PruebaReporte multitabDet);
	
	void eliminarPruebaReporte(int idMultitabCab, String idMultitabDet);
	
}
