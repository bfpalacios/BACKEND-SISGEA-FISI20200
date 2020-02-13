package edu.taller.sisgea.procesos.mapper;

import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import edu.taller.sisgea.procesos.model.AsignacionEspacioAcademico;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IAsignacionEspacioAcademicoMapper extends IMantenibleMapper<AsignacionEspacioAcademico> {

	public void ejecutarProcedimientoAsignacionEspacioAcademico();
	
}
