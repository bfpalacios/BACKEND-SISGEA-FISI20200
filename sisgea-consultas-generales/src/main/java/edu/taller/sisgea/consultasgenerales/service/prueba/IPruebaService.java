package edu.taller.sisgea.consultasgenerales.service.prueba;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.consultasgenerales.model.Prueba;

import java.util.List;

public interface IPruebaService extends IMantenibleService<Prueba> {
	
	List<Prueba> buscarTodosMultitabsDet();
	
	Prueba buscarPrueba(int idMultitabCab, String idMultitabDet);
	
	List<Prueba> buscarMultitabsDetPorMultitabCab(int idMultitabCab);
	
	Prueba registrarPrueba(int idMultitabCab, Prueba multitabDet);
	
	Prueba actualizarPrueba(int idMultitabCab, String idMultitabDet, Prueba multitabDet);
	
	void eliminarPrueba(int idMultitabCab, String idMultitabDet);
	
}
