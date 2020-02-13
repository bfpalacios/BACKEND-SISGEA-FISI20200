package edu.taller.sisgea.mantenimientosgenerales.service.espacioacademico;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.mantenimientosgenerales.model.EspacioAcademico;

import java.util.List;

public interface IEspacioAcademicoService extends IMantenibleService<EspacioAcademico> {
	
	List<EspacioAcademico> buscarTodosEspacioAcademico();
	
	EspacioAcademico buscarEspacioAcademico(Integer idEspacioAcademico);
	
	EspacioAcademico registrarEspacioAcademico(EspacioAcademico espacioAcademico);
	
	EspacioAcademico actualizarEspacioAcademico(Integer idEspacioAcademico, EspacioAcademico espacioAcademico);
	
	void eliminarEspacioAcademico(Integer idEspacioAcademico);
	
}