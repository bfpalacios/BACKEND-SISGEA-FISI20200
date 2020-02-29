package edu.taller.sisgea.seguridad.service.perfilusuario;

import edu.taller.sisgea.seguridad.mapper.IPerfilUsuarioMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.seguridad.model.PerfilUsuario;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PerfilUsuarioService extends MantenibleService<PerfilUsuario> implements IPerfilUsuarioService {
	
	private static final String PERFIL_USUARIO_NO_ENCONTRADO = "El Perfil Usuario %s no existe";
	private final IPerfilUsuarioMapper perfilUsuarioMapper;
	
	public PerfilUsuarioService(@Qualifier("IPerfilUsuarioMapper") IMantenibleMapper<PerfilUsuario> mantenibleMapper) {
		super(mantenibleMapper);
		this.perfilUsuarioMapper = (IPerfilUsuarioMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<PerfilUsuario> buscarTodosPerfilUsuario() {
		return this.buscarTodos();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<PerfilUsuario> buscarPerfilesUsuario(String usuario){
		return this.perfilUsuarioMapper.buscarPerfilesUsuario(usuario);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public PerfilUsuario buscarPerfilUsuario(Integer idPerfilUsuario) {
		return this.perfilUsuarioMapper.buscarPerfilUsuario(idPerfilUsuario).orElseThrow(
				() -> new RecursoNoEncontradoException(PERFIL_USUARIO_NO_ENCONTRADO, idPerfilUsuario));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public PerfilUsuario registrarPerfilUsuario(PerfilUsuario perfilUsuario) {
		this.registrar(perfilUsuario);
		return this.buscarPerfilUsuario(perfilUsuario.getIdPerfilUsuario());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public PerfilUsuario actualizarPerfilUsuario(Integer idPerfilUsuario, PerfilUsuario perfilUsuario) {
		perfilUsuario.setIdPerfilUsuario(idPerfilUsuario);
		this.actualizar(perfilUsuario);
		return this.buscarPerfilUsuario(perfilUsuario.getIdPerfilUsuario());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarPerfilUsuario(Integer idPerfilUsuario) {
		PerfilUsuario perfilUsuario = PerfilUsuario.builder().idPerfilUsuario(idPerfilUsuario).build();
		this.eliminar(perfilUsuario);
	}
	
}
