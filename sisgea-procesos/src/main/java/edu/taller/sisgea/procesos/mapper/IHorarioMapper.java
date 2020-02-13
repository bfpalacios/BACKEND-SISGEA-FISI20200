package edu.taller.sisgea.procesos.mapper;

import edu.taller.sisgea.procesos.model.Horario;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface IHorarioMapper extends IMantenibleMapper<Horario> {

    Optional<Horario> buscarHorario (Integer idHorario, String idCurso, Integer seccion);

}
