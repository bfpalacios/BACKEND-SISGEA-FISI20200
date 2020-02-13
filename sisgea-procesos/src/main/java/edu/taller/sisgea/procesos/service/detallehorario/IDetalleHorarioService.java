package edu.taller.sisgea.procesos.service.detallehorario;

import edu.taller.sisgea.procesos.model.DetalleHorario;
import edu.taller.sisgea.procesos.model.resultadocarga.ResultadoCarga;
import ob.commons.mantenimiento.service.IMantenibleService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IDetalleHorarioService extends IMantenibleService<DetalleHorario> {

    List<DetalleHorario> buscarTodosDetalleHorario();

    DetalleHorario buscarDetalleHorario(Integer idHorarioDetalle,String idCurso,Integer seccion,Integer idHorario);

    List<ResultadoCarga> cargarArchivos(List<MultipartFile> multipartfiles);

}
