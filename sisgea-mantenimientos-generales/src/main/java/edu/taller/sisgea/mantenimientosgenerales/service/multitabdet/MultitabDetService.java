package edu.taller.sisgea.mantenimientosgenerales.service.multitabdet;

import edu.taller.sisgea.mantenimientosgenerales.mapper.IMultitabDetMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.mantenimientosgenerales.model.MultitabDet;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MultitabDetService extends MantenibleService<MultitabDet> implements IMultitabDetService {
	
	private static final String MULTITAB_DET_NO_ENCONTRADO =
			"No existe la asociación entre el detalle de la Tabla de Tablas %s y el Código de la Tabla de Tablas %d";
	private final IMultitabDetMapper multitabDetMapper;
	
	public MultitabDetService(@Qualifier("IMultitabDetMapper") IMantenibleMapper<MultitabDet> mantenibleMapper) {
		super(mantenibleMapper);
		this.multitabDetMapper = (IMultitabDetMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public MultitabDet registrarMultitabDet(int idMultitabCab, MultitabDet multitabDet) {
		multitabDet.setIdMultitabCab(idMultitabCab);
		this.registrar(multitabDet);
		return this.buscarMultitabDet(multitabDet.getIdMultitabCab(), multitabDet.getIdMultitabDet());
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public MultitabDet actualizarMultitabDet(int idMultitabCab, String idMultitabDet, MultitabDet multitabDet) {
		multitabDet.setIdMultitabCab(idMultitabCab);
		multitabDet.setIdMultitabDet(idMultitabDet);
		this.actualizar(multitabDet);
		return this.buscarMultitabDet(multitabDet.getIdMultitabCab(), multitabDet.getIdMultitabDet());
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarMultitabDet(int idMultitabCab, String idMultitabDet) {
		MultitabDet multitabDet = MultitabDet.builder().idMultitabCab(idMultitabCab).idMultitabDet(idMultitabDet)
		                                     .build();
		this.eliminar(multitabDet);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<MultitabDet> buscarTodosMultitabsDet() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public MultitabDet buscarMultitabDet(int idMultitabCab, String idMultitabDet) {
		return this.multitabDetMapper.buscarMultiTabDet(idMultitabCab, idMultitabDet).orElseThrow(
				() -> new RecursoNoEncontradoException(MULTITAB_DET_NO_ENCONTRADO, idMultitabDet, idMultitabCab));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<MultitabDet> buscarMultitabsDetPorMultitabCab(int idMultitabCab) {
		return this.multitabDetMapper.buscarMultitabsDetPorMultitabCab(idMultitabCab);
	}
}
