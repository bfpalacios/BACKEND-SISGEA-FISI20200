package edu.taller.sisgea.procesos.mapper;

import edu.taller.sisgea.procesos.model.DetalleHorario;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface IDetalleHorarioMapper extends IMantenibleMapper<DetalleHorario> {

    Optional<DetalleHorario> buscarDetalleHorario(Integer idHorarioDetalle, String idCurso, Integer seccion, Integer idHorario);

}
