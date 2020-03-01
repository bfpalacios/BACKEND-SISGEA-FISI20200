package edu.taller.sisgea.seguridad.service.auth;

import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import edu.taller.sisgea.seguridad.mapper.IAuthMapper;
import edu.taller.sisgea.seguridad.model.Autorizacion;
import edu.taller.sisgea.seguridad.model.CriterioBusquedaAutorizacion;
import edu.taller.sisgea.seguridad.model.Usuario;
import edu.taller.sisgea.seguridad.util.DatesUtils;

@Service
public class AuthService implements IAuthService{
	
	private IAuthMapper authMapper;
	private static final int AUTORIZATION_DURATION_HOURS = 4;
	
	public AuthService(IAuthMapper authMapper) {
		this.authMapper = (IAuthMapper) authMapper;
	}
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Autorizacion logIn(Usuario usuario) {
		Autorizacion auth = Autorizacion.builder().build();
		CriterioBusquedaAutorizacion criterio = CriterioBusquedaAutorizacion.builder()
				.username(usuario.getUsuario())
				.password(usuario.getContrasenia())
				.build();
		auth.setUsername(usuario.getUsuario());
		//verificar autenticacion
		auth.setExito(this.authMapper.autenticarUsuario(criterio));
		if(auth.isExito()) {
			//buscar recursos del usuario
			auth.setRecursos(this.authMapper.buscarPerfilPorUsuario(criterio));
			//crear autorizacion
			auth.setInicioAutorizacion(new Date());
			auth.setFinAutorizacion(DatesUtils.sumarRestarHorasFecha(auth.getInicioAutorizacion(),AUTORIZATION_DURATION_HOURS));
		}
		return auth;
	}
	
}
