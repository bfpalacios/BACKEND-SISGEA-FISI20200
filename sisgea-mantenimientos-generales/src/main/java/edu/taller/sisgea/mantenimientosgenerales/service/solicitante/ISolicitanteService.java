package edu.taller.sisgea.mantenimientosgenerales.service.solicitante;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.mantenimientosgenerales.model.Solicitante;

import java.util.List;

public interface ISolicitanteService extends IMantenibleService<Solicitante> {
	
	List<Solicitante> buscarTodosSolicitante();
	
	Solicitante buscarSolicitante(Integer idSolicitante);
	
	Solicitante registrarSolicitante(Solicitante solicitante);
	
	Solicitante actualizarSolicitante(Integer idSolicitante, Solicitante solicitante);
	
	void eliminarSolicitante(Integer idSolicitante);
	
}