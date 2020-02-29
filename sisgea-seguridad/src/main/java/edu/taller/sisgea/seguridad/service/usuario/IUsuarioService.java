package edu.taller.sisgea.seguridad.service.usuario;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.seguridad.model.Usuario;

import java.util.List;

public interface IUsuarioService extends IMantenibleService<Usuario> {
	
	List<Usuario> buscarTodosUsuario();
	
	Usuario buscarUsuario(String idUsuario);
	
	Usuario registrarUsuario(Usuario usuario);
	
	Usuario actualizarUsuario(String idUsuario, Usuario usuario);
	
	void eliminarUsuario(String idUsuario);
	
}