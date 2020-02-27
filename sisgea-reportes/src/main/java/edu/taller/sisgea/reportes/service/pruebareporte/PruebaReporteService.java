package edu.taller.sisgea.reportes.service.pruebareporte;

import edu.taller.sisgea.reportes.mapper.IPruebaReporteMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.reportes.model.PruebaReporte;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PruebaReporteService extends MantenibleService<PruebaReporte> implements IPruebaReporteService {
	
	private static final String MULTITAB_DET_NO_ENCONTRADO =
			"No existe la asociación entre el detalle de la Tabla de Tablas %s y el Código de la Tabla de Tablas %d";
	private final IPruebaReporteMapper pruebaReporteMapper;
	
	public PruebaReporteService(@Qualifier("IPruebaReporteMapper") IMantenibleMapper<PruebaReporte> mantenibleMapper) {
		super(mantenibleMapper);
		this.pruebaReporteMapper = (IPruebaReporteMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public PruebaReporte registrarPruebaReporte(int idMultitabCab, PruebaReporte pruebaReporte) {
		pruebaReporte.setIdMultitabCab(idMultitabCab);
		this.registrar(pruebaReporte);
		return this.buscarPruebaReporte(pruebaReporte.getIdMultitabCab(), pruebaReporte.getIdMultitabDet());
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public PruebaReporte actualizarPruebaReporte(int idMultitabCab, String idMultitabDet, PruebaReporte pruebaReporte) {
		pruebaReporte.setIdMultitabCab(idMultitabCab);
		pruebaReporte.setIdMultitabDet(idMultitabDet);
		this.actualizar(pruebaReporte);
		return this.buscarPruebaReporte(pruebaReporte.getIdMultitabCab(), pruebaReporte.getIdMultitabDet());
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarPruebaReporte(int idMultitabCab, String idMultitabDet) {
		PruebaReporte pruebaReporte = PruebaReporte.builder().idMultitabCab(idMultitabCab).idMultitabDet(idMultitabDet)
		                                     .build();
		this.eliminar(pruebaReporte);
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<PruebaReporte> buscarTodosMultitabsDet() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public PruebaReporte buscarPruebaReporte(int idMultitabCab, String idMultitabDet) {
		return this.pruebaReporteMapper.buscarMultiTabDet(idMultitabCab, idMultitabDet).orElseThrow(
				() -> new RecursoNoEncontradoException(MULTITAB_DET_NO_ENCONTRADO, idMultitabDet, idMultitabCab));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<PruebaReporte> buscarMultitabsDetPorMultitabCab(int idMultitabCab) {
		return this.pruebaReporteMapper.buscarMultitabsDetPorMultitabCab(idMultitabCab);
	}
	
}
