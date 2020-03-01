package edu.taller.sisgea.procesos.service.detallehorario;

import edu.taller.sisgea.procesos.mapper.IDetalleHorarioMapper;
import edu.taller.sisgea.procesos.model.DetalleHorario;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.excel.exception.ReadingExcelFileException;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class DetalleHorarioService extends MantenibleService<DetalleHorario> implements IDetalleHorarioService {

    private static final String DETALLE_HORARIO_NO_ENCONTRADO = "El Detalle del Horario de id de horario detalle %d, id curso %s, seccion %d, id horario %s no existe";
    private final IDetalleHorarioMapper detalleHorarioMapper;

    public DetalleHorarioService(@Qualifier("IDetalleHorarioMapper") IMantenibleMapper<DetalleHorario> mantenibleMapper) {
        super(mantenibleMapper);
        this.detalleHorarioMapper = (IDetalleHorarioMapper) mantenibleMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<DetalleHorario> buscarTodosDetalleHorario() {
        return this.buscarTodos();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public DetalleHorario buscarDetalleHorario(Integer idHorarioDetalle,String idCurso,Integer seccion,Integer idHorario) {
        return this.detalleHorarioMapper.buscarDetalleHorario(idHorarioDetalle,idCurso,seccion,idHorario).orElseThrow(
                () -> new RecursoNoEncontradoException(DETALLE_HORARIO_NO_ENCONTRADO, idHorarioDetalle,idCurso,seccion,idHorario));
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<DetalleHorario> cargarArchivos(List<MultipartFile> multipartfiles) {
        List<DetalleHorario> listaDetallesHorario = new ArrayList<>();
        for (MultipartFile multipartfile : multipartfiles) {
            String filename = multipartfile.getOriginalFilename();
            try (BufferedInputStream bis = new BufferedInputStream(multipartfile.getInputStream())) {
            	listaDetallesHorario = this.leerExcel(filename, bis);
            } catch (IOException e) {
                throw new RecursoNoEncontradoException(e.getMessage());
            }
        }
        return listaDetallesHorario;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public List<DetalleHorario> leerExcel(String filename, InputStream inputStream){
        try (Workbook workbook = WorkbookFactory.create(inputStream)) {
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator();
            Row row;
            rowIterator.next();
            List<DetalleHorario> listaFilas = new ArrayList<>();
            while (rowIterator.hasNext()) {
                row = rowIterator.next();
                Integer idHorarioDetalle    = (int) Double.parseDouble(String.valueOf(row.getCell(0)));
                String idCurso              = String.valueOf(row.getCell(1));
                Integer seccion             = (int) Double.parseDouble(String.valueOf(row.getCell(2)));
                Integer idHorario           = (int) Double.parseDouble(String.valueOf(row.getCell(3)));
                String tipoHorario          = String.valueOf(row.getCell(4));
                String horarioInicio       	= String.valueOf(row.getCell(5));
                String horarioFin          	= String.valueOf(row.getCell(6));
                DetalleHorario fila = DetalleHorario.builder()
                        .idHorarioDetalle(idHorarioDetalle)
                        .idCurso(idCurso)
                        .seccion(seccion)
                        .idHorario(idHorario)
                        .tipoHorario(tipoHorario)
                        .horarioInicio(horarioInicio)
                        .horarioFin(horarioFin)
                        .build();
                listaFilas.add(fila);
            }
            return this.cargarExcel(listaFilas);
        } catch (IOException ex) {
            throw new ReadingExcelFileException("Asegúrese de que se trata de un archivo Excel. Nombre de archivo: " + filename);
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public List<DetalleHorario> cargarExcel(List<DetalleHorario> listaDetallesHorario){
    	listaDetallesHorario.forEach((detH)->{
			DetalleHorario detalleHorario = DetalleHorario.builder()
					.idHorarioDetalle(detH.getIdHorarioDetalle())
					.idCurso(detH.getIdCurso())
					.seccion(detH.getSeccion())
					.idHorario(detH.getIdHorario())
					.tipoHorario(detH.getTipoHorario())
					.horarioInicio(detH.getHorarioInicio())
					.horarioFin(detH.getHorarioFin())
					.build();
			this.registrarDetalleHorario(detalleHorario);
		});
		return listaDetallesHorario;
    }
    
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public DetalleHorario registrarDetalleHorario(DetalleHorario detalleHorario) {
		this.registrar(detalleHorario);
		return this.buscarDetalleHorario(detalleHorario.getIdHorarioDetalle(), detalleHorario.getIdCurso(), detalleHorario.getSeccion(), detalleHorario.getIdHorario());
	}

}
