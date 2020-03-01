package edu.taller.sisgea.procesos.service.horario;

import edu.taller.sisgea.procesos.model.Horario;
import ob.commons.mantenimiento.service.IMantenibleService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IHorarioService extends IMantenibleService<Horario> {

    List<Horario> buscarTodosHorario();

    Horario buscarHorario(Integer idHorario, String idCurso, Integer seccion);

    List<Horario> cargarArchivos(List<MultipartFile> multipartFiles);

    Horario registrarHorario(Horario horario);

}
