package edu.taller.sisgea.procesos.mapper;

import edu.taller.sisgea.procesos.model.Curso;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface ICursoMapper extends IMantenibleMapper<Curso> {

    Optional<Curso> buscarCurso(String idCurso);

}
