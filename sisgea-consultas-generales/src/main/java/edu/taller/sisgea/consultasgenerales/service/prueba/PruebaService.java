package edu.taller.sisgea.consultasgenerales.service.prueba;

import edu.taller.sisgea.consultasgenerales.mapper.IPruebaMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.consultasgenerales.model.Prueba;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PruebaService extends MantenibleService<Prueba> implements IPruebaService {
	
	private static final String MULTITAB_DET_NO_ENCONTRADO =
			"No existe la asociación entre el detalle de la Tabla de Tablas %s y el Código de la Tabla de Tablas %d";
	private final IPruebaMapper pruebaMapper;
	
	public PruebaService(@Qualifier("IPruebaMapper") IMantenibleMapper<Prueba> mantenibleMapper) {
		super(mantenibleMapper);
		this.pruebaMapper = (IPruebaMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Prueba registrarPrueba(int idMultitabCab, Prueba prueba) {
		prueba.setIdMultitabCab(idMultitabCab);
		this.registrar(prueba);
		return this.buscarPrueba(prueba.getIdMultitabCab(), prueba.getIdMultitabDet());
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Prueba actualizarPrueba(int idMultitabCab, String idMultitabDet, Prueba prueba) {
		prueba.setIdMultitabCab(idMultitabCab);
		prueba.setIdMultitabDet(idMultitabDet);
		this.actualizar(prueba);
		return this.buscarPrueba(prueba.getIdMultitabCab(), prueba.getIdMultitabDet());
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarPrueba(int idMultitabCab, String idMultitabDet) {
		Prueba prueba = Prueba.builder().idMultitabCab(idMultitabCab).idMultitabDet(idMultitabDet)
		                                     .build();
		this.eliminar(prueba);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Prueba> buscarTodosMultitabsDet() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Prueba buscarPrueba(int idMultitabCab, String idMultitabDet) {
		return this.pruebaMapper.buscarMultiTabDet(idMultitabCab, idMultitabDet).orElseThrow(
				() -> new RecursoNoEncontradoException(MULTITAB_DET_NO_ENCONTRADO, idMultitabDet, idMultitabCab));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<Prueba> buscarMultitabsDetPorMultitabCab(int idMultitabCab) {
		return this.pruebaMapper.buscarMultitabsDetPorMultitabCab(idMultitabCab);
	}
	
}
