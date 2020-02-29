package edu.taller.sisgea.seguridad.service.perfilusuario;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.seguridad.model.PerfilUsuario;

import java.util.List;

public interface IPerfilUsuarioService extends IMantenibleService<PerfilUsuario> {
	
	List<PerfilUsuario> buscarTodosPerfilUsuario();

	List<PerfilUsuario> buscarPerfilesUsuario(String usuario);
	
	PerfilUsuario buscarPerfilUsuario(Integer idPerfilUsuario);
	
	PerfilUsuario registrarPerfilUsuario(PerfilUsuario perfilUsuario);
	
	PerfilUsuario actualizarPerfilUsuario(Integer idPerfilUsuario, PerfilUsuario perfilUsuario);
	
	void eliminarPerfilUsuario(Integer idPerfilUsuario);
	
}