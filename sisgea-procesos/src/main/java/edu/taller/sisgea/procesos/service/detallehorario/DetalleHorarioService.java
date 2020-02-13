package edu.taller.sisgea.procesos.service.detallehorario;

import edu.taller.sisgea.procesos.mapper.IDetalleHorarioMapper;
import edu.taller.sisgea.procesos.model.DetalleHorario;
import edu.taller.sisgea.procesos.model.resultadocarga.ResultadoCarga;
import ob.commons.error.exception.RecursoNoEncontradoException;
import ob.commons.excel.exception.ReadingExcelFileException;
import ob.commons.excel.util.TypesUtil;
import ob.commons.mantenimiento.mapper.IMantenibleMapper;
import ob.commons.mantenimiento.service.MantenibleService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.sql.DataSource;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class DetalleHorarioService extends MantenibleService<DetalleHorario> implements IDetalleHorarioService {

    private static final String DETALLE_HORARIO_NO_ENCONTRADO = "El Detalle del Horario de id de horario detalle %d, id curso %s, seccion %d, id horario %s no existe";
    private final IDetalleHorarioMapper detalleHorarioMapper;

    private @Autowired DataSource dataSource;

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
    public List<ResultadoCarga> cargarArchivos(List<MultipartFile> multipartfiles) {
        List<ResultadoCarga> listaResultados = new ArrayList<>();
        for (MultipartFile multipartfile : multipartfiles) {
            String filename = multipartfile.getOriginalFilename();
            try (BufferedInputStream bis = new BufferedInputStream(multipartfile.getInputStream())) {
                ResultadoCarga resultadoCarga = leerExcel(filename, bis);
                listaResultados.add(resultadoCarga);
            } catch (IOException e) {
                throw new RecursoNoEncontradoException(e.getMessage());
            }
        }
        return listaResultados;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResultadoCarga leerExcel(String filename, InputStream inputStream){
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
                String horarioInicio          = String.valueOf(row.getCell(5));
                String horarioFin             = String.valueOf(row.getCell(6));
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
            cargarExcel(listaFilas);
            ResultadoCarga resultadoCarga = ResultadoCarga.builder()
                    .nombreArchivo(filename)
                    .numeroRegistros(listaFilas.size())
                    .exito(true)
                    .build();
            return resultadoCarga;
        } catch (IOException ex) {
            throw new ReadingExcelFileException(
                    "Asegúrese de que se trata de un archivo Excel. Nombre de archivo: " + filename);
        } catch (Exception ex) {
            ResultadoCarga resultadoCargaFallida = ResultadoCarga.builder()
                    .nombreArchivo(filename)
                    .numeroRegistros(0)
                    .exito(false)
                    .build();
            return resultadoCargaFallida;
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void cargarExcel(List<DetalleHorario> listaFilas){
        int batchSize = 1000;
        if(listaFilas.size()<=0){
            return;
        }
        try(Connection conn = dataSource.getConnection()){
            conn.setAutoCommit(false);
            try{
                PreparedStatement stmt = conn.prepareStatement(
                        "INSERT INTO MAE_HORARIO_DETALLE("+
                                "ID_HORARIO_DETALLE	      	," +
                                "ID_CURSO	      	," +
                                "SECCION	  		," +
                                "ID_HORARIO				 ," +
                                "TIPO_HORARIO				 ," +
                                "HORARIO_INICIO				 ," +
                                "HORARIO_FIN				 " +
                                ") VALUES ("+
                                "?,"+
                                "?,"+
                                "?,"+
                                "?,"+
                                "?,"+
                                "?,"+
                                "? "+
                                ")") ;
                int[] idx = { 0 };
                Iterator<DetalleHorario> itDetalleHorario = listaFilas.iterator();
                DetalleHorario detalleHorario;
                while(itDetalleHorario.hasNext()){
                    detalleHorario = itDetalleHorario.next();
                    try{
                        TypesUtil.validarBDInteger(stmt,1,detalleHorario.getIdHorarioDetalle());
                        TypesUtil.validarBDString(stmt,2,detalleHorario.getIdCurso());
                        TypesUtil.validarBDInteger(stmt,3,detalleHorario.getSeccion());
                        TypesUtil.validarBDInteger(stmt,4,detalleHorario.getIdHorario());
                        TypesUtil.validarBDString(stmt,5,detalleHorario.getTipoHorario());
                        TypesUtil.validarBDString(stmt,6,detalleHorario.getHorarioInicio());
                        TypesUtil.validarBDString(stmt,7,detalleHorario.getHorarioFin());
                        stmt.addBatch();
                        idx[0]++;
                        if (idx[0] % batchSize == 0 ) {
                            stmt.executeBatch();
                            conn.commit();
                            stmt.clearBatch();
                            stmt.clearParameters();
                            idx[0] = 0;
                        }
                    }catch(SQLException e){
                        if (conn != null) {
                            try {
                                conn.rollback();
                            } catch (Exception ex) {
                            }
                        }
                    }
                }

                if(idx[0]>0){
                    stmt.executeBatch();
                    conn.commit();
                }

            }catch(SQLException e){
                if (conn != null) {
                    try {
                        conn.rollback();
                    } catch (Exception ex) {
                    }
                }
                e.printStackTrace();
            }
        }catch (SQLException e ){
            e.printStackTrace();
        }
    }

}
