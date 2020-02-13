package edu.taller.sisgea.procesos.service.asignacionespacioacademico;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.procesos.model.AsignacionEspacioAcademico;
import java.util.List;

public interface IAsignacionEspacioAcademicoService extends IMantenibleService<AsignacionEspacioAcademico> {
	
	List<AsignacionEspacioAcademico> buscarTodosAsignacionEspacioAcademico();
	
	void ejecutarProcedimientoAsignacionEspacioAcademico ();
	
}