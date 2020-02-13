package edu.taller.sisgea.procesos.service.asignacionespacioacademico;

import edu.taller.sisgea.procesos.mapper.IAsignacionEspacioAcademicoMapper;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import edu.taller.sisgea.procesos.model.AsignacionEspacioAcademico;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AsignacionEspacioAcademicoService extends MantenibleService<AsignacionEspacioAcademico> implements IAsignacionEspacioAcademicoService {
	
	private final IAsignacionEspacioAcademicoMapper asignacionEspacioAcademicoMapper;
	
	public AsignacionEspacioAcademicoService(@Qualifier("IAsignacionEspacioAcademicoMapper") IMantenibleMapper<AsignacionEspacioAcademico> mantenibleMapper) {
		super(mantenibleMapper);
		this.asignacionEspacioAcademicoMapper = (IAsignacionEspacioAcademicoMapper) mantenibleMapper;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<AsignacionEspacioAcademico> buscarTodosAsignacionEspacioAcademico() {
		return this.buscarTodos();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void ejecutarProcedimientoAsignacionEspacioAcademico(){
		this.asignacionEspacioAcademicoMapper.ejecutarProcedimientoAsignacionEspacioAcademico();
	}
	
}
