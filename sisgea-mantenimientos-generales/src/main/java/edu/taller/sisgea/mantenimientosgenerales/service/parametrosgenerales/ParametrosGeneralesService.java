package edu.taller.sisgea.mantenimientosgenerales.service.parametrosgenerales;

import edu.taller.sisgea.mantenimientosgenerales.mapper.IParametrosGeneralesMapper;
import edu.taller.sisgea.mantenimientosgenerales.model.ParametrosGenerales;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ParametrosGeneralesService extends MantenibleService<ParametrosGenerales> implements IParametrosGeneralesService {

    private static final String PARAMETROS_GENERALES_NO_ENCONTRADO = "Los parámetros de sistema no existen.";

    private final IParametrosGeneralesMapper parametrosGeneralesMapper;

    public ParametrosGeneralesService(@Qualifier("IParametrosGeneralesMapper") IMantenibleMapper<ParametrosGenerales> mantenibleMapper){
        super(mantenibleMapper);
        this.parametrosGeneralesMapper = (IParametrosGeneralesMapper) mantenibleMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<ParametrosGenerales> buscarTodosParametrosGenerales(){
        return this.buscarTodos();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public ParametrosGenerales actualizarParametrosGenerales(ParametrosGenerales parametrosGenerales) {
        this.actualizar(parametrosGenerales);
        return this.buscarTodosParametrosGenerales().stream().findFirst().orElseThrow(
                () -> new RecursoNoEncontradoException(PARAMETROS_GENERALES_NO_ENCONTRADO));
    }

}
