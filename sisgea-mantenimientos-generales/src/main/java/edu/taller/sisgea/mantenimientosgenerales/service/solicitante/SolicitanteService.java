package edu.taller.sisgea.mantenimientosgenerales.service.solicitante;

import edu.taller.sisgea.mantenimientosgenerales.mapper.ISolicitanteMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.mantenimientosgenerales.model.Solicitante;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SolicitanteService extends MantenibleService<Solicitante> implements ISolicitanteService {
	
	private static final String SOLICITANTE_NO_ENCONTRADO = "El Solicitante %s no existe";
	private final ISolicitanteMapper solicitanteMapper;
	
	public SolicitanteService(@Qualifier("ISolicitanteMapper") IMantenibleMapper<Solicitante> mantenibleMapper) {
		super(mantenibleMapper);
		this.solicitanteMapper = (ISolicitanteMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Solicitante> buscarTodosSolicitante() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Solicitante buscarSolicitante(Integer idSolicitante) {
		return this.solicitanteMapper.buscarSolicitante(idSolicitante).orElseThrow(
				() -> new RecursoNoEncontradoException(SOLICITANTE_NO_ENCONTRADO, idSolicitante));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Solicitante registrarSolicitante(Solicitante solicitante) {
		this.registrar(solicitante);
		return this.buscarSolicitante(solicitante.getIdSolicitante());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Solicitante actualizarSolicitante(Integer idSolicitante, Solicitante solicitante) {
		solicitante.setIdSolicitante(idSolicitante);
		this.actualizar(solicitante);
		return this.buscarSolicitante(solicitante.getIdSolicitante());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarSolicitante(Integer idSolicitante) {
		Solicitante solicitante = Solicitante.builder().idSolicitante(idSolicitante).build();
		this.eliminar(solicitante);
	}
	
}
