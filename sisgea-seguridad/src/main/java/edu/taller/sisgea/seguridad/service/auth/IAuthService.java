package edu.taller.sisgea.seguridad.service.auth;

import edu.taller.sisgea.seguridad.model.Autorizacion;
import edu.taller.sisgea.seguridad.model.Usuario;

public interface IAuthService {

	Autorizacion logIn(Usuario usuario);
}
