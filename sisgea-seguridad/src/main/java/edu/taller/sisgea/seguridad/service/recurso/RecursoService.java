package edu.taller.sisgea.seguridad.service.recurso;

import edu.taller.sisgea.seguridad.mapper.IRecursoMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.seguridad.model.Recurso;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RecursoService extends MantenibleService<Recurso> implements IRecursoService {
	
	private static final String RECURSO_NO_ENCONTRADO = "El Recurso %s no existe";
	private final IRecursoMapper recursoMapper;
	
	public RecursoService(@Qualifier("IRecursoMapper") IMantenibleMapper<Recurso> mantenibleMapper) {
		super(mantenibleMapper);
		this.recursoMapper = (IRecursoMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Recurso> buscarTodosRecurso() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Recurso buscarRecurso(String idRecurso) {
		return this.recursoMapper.buscarRecurso(idRecurso).orElseThrow(
				() -> new RecursoNoEncontradoException(RECURSO_NO_ENCONTRADO, idRecurso));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Recurso registrarRecurso(Recurso recurso) {
		this.registrar(recurso);
		return this.buscarRecurso(recurso.getIdRecurso());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Recurso actualizarRecurso(String idRecurso, Recurso recurso) {
		recurso.setIdRecurso(idRecurso);
		this.actualizar(recurso);
		return this.buscarRecurso(recurso.getIdRecurso());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarRecurso(String idRecurso) {
		Recurso recurso = Recurso.builder().idRecurso(idRecurso).build();
		this.eliminar(recurso);
	}
	
}
