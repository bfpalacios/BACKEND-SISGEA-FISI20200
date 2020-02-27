package edu.taller.sisgea.procesos.service.asignacionmanualespacioacademico;

import edu.taller.sisgea.procesos.mapper.IAsignacionManualEspacioAcademicoMapper;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.procesos.model.AsignacionManualEspacioAcademico;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AsignacionManualEspacioAcademicoService extends MantenibleService<AsignacionManualEspacioAcademico> implements IAsignacionManualEspacioAcademicoService {
	
	private static final String ASIGNACION_ESPACIO_ACADEMICO_NO_ENCONTRADO = "La asignación %s no existe";
	private final IAsignacionManualEspacioAcademicoMapper asignacionManualEspacioAcademicoMapper;
	
	public AsignacionManualEspacioAcademicoService(@Qualifier("IAsignacionManualEspacioAcademicoMapper") IMantenibleMapper<AsignacionManualEspacioAcademico> mantenibleMapper) {
		super(mantenibleMapper);
		this.asignacionManualEspacioAcademicoMapper = (IAsignacionManualEspacioAcademicoMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<AsignacionManualEspacioAcademico> buscarTodosAsignacionManualEspacioAcademico() {
		return this.buscarTodos();
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public AsignacionManualEspacioAcademico buscarAsignacionManualEspacioAcademico(Integer idAsignacion) {
		return this.asignacionManualEspacioAcademicoMapper.buscarAsignacionManualEspacioAcademico(idAsignacion).orElseThrow(
				() -> new RecursoNoEncontradoException(ASIGNACION_ESPACIO_ACADEMICO_NO_ENCONTRADO, idAsignacion));
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public AsignacionManualEspacioAcademico actualizarAsignacionManualEspacioAcademico(Integer idAsignacion, AsignacionManualEspacioAcademico asignacionManualEspacioAcademico) {
		asignacionManualEspacioAcademico.setIdAsignacion(idAsignacion);
		this.actualizar(asignacionManualEspacioAcademico);
		return this.buscarAsignacionManualEspacioAcademico(asignacionManualEspacioAcademico.getIdAsignacion());
	}
	
}
