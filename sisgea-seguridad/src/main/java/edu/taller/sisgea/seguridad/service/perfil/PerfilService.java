package edu.taller.sisgea.seguridad.service.perfil;

import edu.taller.sisgea.seguridad.mapper.IPerfilMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.seguridad.model.Perfil;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PerfilService extends MantenibleService<Perfil> implements IPerfilService {
	
	private static final String PERFIL_NO_ENCONTRADO = "El Perfil %s no existe";
	private final IPerfilMapper perfilMapper;
	
	public PerfilService(@Qualifier("IPerfilMapper") IMantenibleMapper<Perfil> mantenibleMapper) {
		super(mantenibleMapper);
		this.perfilMapper = (IPerfilMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Perfil> buscarTodosPerfil() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Perfil buscarPerfil(Integer idPerfil) {
		return this.perfilMapper.buscarPerfil(idPerfil).orElseThrow(
				() -> new RecursoNoEncontradoException(PERFIL_NO_ENCONTRADO, idPerfil));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Perfil registrarPerfil(Perfil perfil) {
		this.registrar(perfil);
		return this.buscarPerfil(perfil.getIdPerfil());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Perfil actualizarPerfil(Integer idPerfil, Perfil perfil) {
		perfil.setIdPerfil(idPerfil);
		this.actualizar(perfil);
		return this.buscarPerfil(perfil.getIdPerfil());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarPerfil(Integer idPerfil) {
		Perfil perfil = Perfil.builder().idPerfil(idPerfil).build();
		this.eliminar(perfil);
	}
	
}
