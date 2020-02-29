package edu.taller.sisgea.seguridad.service.perfilrecurso;

import edu.taller.sisgea.seguridad.mapper.IPerfilRecursoMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.seguridad.model.PerfilRecurso;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PerfilRecursoService extends MantenibleService<PerfilRecurso> implements IPerfilRecursoService {
	
	private static final String PERFIL_RECURSO_NO_ENCONTRADO = "El Perfil Recurso %s no existe";
	private final IPerfilRecursoMapper perfilRecursoMapper;
	
	public PerfilRecursoService(@Qualifier("IPerfilRecursoMapper") IMantenibleMapper<PerfilRecurso> mantenibleMapper) {
		super(mantenibleMapper);
		this.perfilRecursoMapper = (IPerfilRecursoMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<PerfilRecurso> buscarTodosPerfilRecurso() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public PerfilRecurso buscarPerfilRecurso(Integer idPerfilRecurso) {
		return this.perfilRecursoMapper.buscarPerfilRecurso(idPerfilRecurso).orElseThrow(
				() -> new RecursoNoEncontradoException(PERFIL_RECURSO_NO_ENCONTRADO, idPerfilRecurso));
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<PerfilRecurso> buscarRecursosPerfil(Integer idPerfil) {
		return this.perfilRecursoMapper.buscarRecursosPerfil(idPerfil);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public PerfilRecurso registrarPerfilRecurso(PerfilRecurso perfilRecurso) {
		this.registrar(perfilRecurso);
		return this.buscarPerfilRecurso(perfilRecurso.getIdPerfilRecurso());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public PerfilRecurso actualizarPerfilRecurso(Integer idPerfilRecurso, PerfilRecurso perfilRecurso) {
		perfilRecurso.setIdPerfilRecurso(idPerfilRecurso);
		this.actualizar(perfilRecurso);
		return this.buscarPerfilRecurso(perfilRecurso.getIdPerfilRecurso());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarPerfilRecurso(Integer idPerfilRecurso) {
		PerfilRecurso perfilRecurso = PerfilRecurso.builder().idPerfilRecurso(idPerfilRecurso).build();
		this.eliminar(perfilRecurso);
	}
	
}
