package edu.taller.sisgea.procesos.service.asignacionmanualespacioacademico;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.procesos.model.AsignacionManualEspacioAcademico;
import java.util.List;

public interface IAsignacionManualEspacioAcademicoService extends IMantenibleService<AsignacionManualEspacioAcademico> {
	
	List<AsignacionManualEspacioAcademico> buscarTodosAsignacionManualEspacioAcademico();
	
	AsignacionManualEspacioAcademico buscarAsignacionManualEspacioAcademico(Integer idAsignacion);
	
	AsignacionManualEspacioAcademico actualizarAsignacionManualEspacioAcademico(Integer idAsignacion, AsignacionManualEspacioAcademico asignacionManualEspacioAcademico);
	
}