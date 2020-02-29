package edu.taller.sisgea.seguridad.service.usuario;

import edu.taller.sisgea.seguridad.mapper.IUsuarioMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.seguridad.model.Usuario;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UsuarioService extends MantenibleService<Usuario> implements IUsuarioService {
	
	private static final String USUARIO_NO_ENCONTRADO = "El Usuario %s no existe";
	private final IUsuarioMapper usuarioMapper;
	
	public UsuarioService(@Qualifier("IUsuarioMapper") IMantenibleMapper<Usuario> mantenibleMapper) {
		super(mantenibleMapper);
		this.usuarioMapper = (IUsuarioMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Usuario> buscarTodosUsuario() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Usuario buscarUsuario(String idUsuario) {
		return this.usuarioMapper.buscarUsuario(idUsuario).orElseThrow(
				() -> new RecursoNoEncontradoException(USUARIO_NO_ENCONTRADO, idUsuario));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Usuario registrarUsuario(Usuario usuario) {
		this.registrar(usuario);
		return this.buscarUsuario(usuario.getUsuario());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Usuario actualizarUsuario(String idUsuario, Usuario usuario) {
		usuario.setUsuario(idUsuario);
		this.actualizar(usuario);
		return this.buscarUsuario(usuario.getUsuario());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarUsuario(String idUsuario) {
		Usuario usuario = Usuario.builder().usuario(idUsuario).build();
		this.eliminar(usuario);
	}
	
}
