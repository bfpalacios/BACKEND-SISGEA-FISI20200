package edu.taller.sisgea.mantenimientosgenerales.service.espacioacademico;

import edu.taller.sisgea.mantenimientosgenerales.mapper.IEspacioAcademicoMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.mantenimientosgenerales.model.EspacioAcademico;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EspacioAcademicoService extends MantenibleService<EspacioAcademico> implements IEspacioAcademicoService {
	
	private static final String ESPACIO_ACADEMICO_NO_ENCONTRADO = "El Espacio Académico %s no existe";
	private final IEspacioAcademicoMapper espacioAcademicoMapper;
	
	public EspacioAcademicoService(@Qualifier("IEspacioAcademicoMapper") IMantenibleMapper<EspacioAcademico> mantenibleMapper) {
		super(mantenibleMapper);
		this.espacioAcademicoMapper = (IEspacioAcademicoMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<EspacioAcademico> buscarTodosEspacioAcademico() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public EspacioAcademico buscarEspacioAcademico(Integer idEspacioAcademico) {
		return this.espacioAcademicoMapper.buscarEspacioAcademico(idEspacioAcademico).orElseThrow(
				() -> new RecursoNoEncontradoException(ESPACIO_ACADEMICO_NO_ENCONTRADO, idEspacioAcademico));
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public EspacioAcademico registrarEspacioAcademico(EspacioAcademico espacioAcademico) {
		this.registrar(espacioAcademico);
		return this.buscarEspacioAcademico(espacioAcademico.getIdEspacioAcademico());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public EspacioAcademico actualizarEspacioAcademico(Integer idEspacioAcademico, EspacioAcademico espacioAcademico) {
		espacioAcademico.setIdEspacioAcademico(idEspacioAcademico);
		this.actualizar(espacioAcademico);
		return this.buscarEspacioAcademico(espacioAcademico.getIdEspacioAcademico());
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void eliminarEspacioAcademico(Integer idEspacioAcademico) {
		EspacioAcademico espacioAcademico = EspacioAcademico.builder().idEspacioAcademico(idEspacioAcademico).build();
		this.eliminar(espacioAcademico);
	}
	
}
