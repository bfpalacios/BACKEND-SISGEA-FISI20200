package edu.taller.sisgea.mantenimientosgenerales.service.multitabcab;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.mantenimientosgenerales.model.MultitabCab;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MultitabCabService extends MantenibleService<MultitabCab> implements IMultitabCabService {
	
	public MultitabCabService(@Qualifier("IMultitabCabMapper") IMantenibleMapper<MultitabCab> mantenibleMapper) {
		super(mantenibleMapper);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<MultitabCab> buscarTodosMultitabsCab() {
		return super.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public MultitabCab registrarMultitabCab(MultitabCab multitabCab) {
		this.registrar(multitabCab);
		return multitabCab;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public MultitabCab actualizarMultitabCab(int idMultitabCab, MultitabCab multitabCab) {
		multitabCab.setIdMultitabCab(idMultitabCab);
		this.actualizar(multitabCab);
		return multitabCab;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarMultitabCab(int idMultitabCab) {
		MultitabCab multitabCab = MultitabCab.builder().idMultitabCab(idMultitabCab).build();
		this.eliminar(multitabCab);
	}
}
