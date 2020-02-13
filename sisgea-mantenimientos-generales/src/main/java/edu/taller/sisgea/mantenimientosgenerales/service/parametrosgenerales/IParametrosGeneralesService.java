package edu.taller.sisgea.mantenimientosgenerales.service.parametrosgenerales;

import edu.taller.sisgea.mantenimientosgenerales.model.ParametrosGenerales;
import ob.commons.mantenimiento.service.IMantenibleService;

import java.util.List;

public interface IParametrosGeneralesService extends IMantenibleService<ParametrosGenerales> {

    List<ParametrosGenerales> buscarTodosParametrosGenerales();

    ParametrosGenerales actualizarParametrosGenerales(ParametrosGenerales parametrosGenerales);

}
