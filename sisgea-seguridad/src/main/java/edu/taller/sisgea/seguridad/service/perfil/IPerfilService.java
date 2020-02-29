package edu.taller.sisgea.seguridad.service.perfil;

import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.seguridad.model.Perfil;

import java.util.List;

public interface IPerfilService extends IMantenibleService<Perfil> {
	
	List<Perfil> buscarTodosPerfil();
	
	Perfil buscarPerfil(Integer idPerfil);
	
	Perfil registrarPerfil(Perfil perfil);
	
	Perfil actualizarPerfil(Integer idPerfil, Perfil perfil);
	
	void eliminarPerfil(Integer idPerfil);
	
}