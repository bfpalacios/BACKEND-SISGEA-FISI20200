package edu.taller.sisgea.procesos.service.curso;

import edu.taller.sisgea.procesos.mapper.ICursoMapper;
import edu.taller.sisgea.procesos.model.Curso;
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
public class CursoService extends MantenibleService<Curso> implements ICursoService {

    private static final String CURSO_NO_ENCONTRADO = "La programación del Curso %s no existe";
    private final ICursoMapper cursoMapper;

    private @Autowired DataSource dataSource;

    public CursoService(@Qualifier("ICursoMapper") IMantenibleMapper<Curso> mantenibleMapper) {
        super(mantenibleMapper);
        this.cursoMapper = (ICursoMapper) mantenibleMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<Curso> buscarTodosCursos() {
        return this.buscarTodos();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public Curso buscarCurso(String idCurso) {
        return this.cursoMapper.buscarCurso(idCurso).orElseThrow(
                () -> new RecursoNoEncontradoException(CURSO_NO_ENCONTRADO, idCurso));
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<ResultadoCarga> cargaArchivos(List<MultipartFile> multipartfiles) {
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
            List<Curso> listaFilas = new ArrayList<>();
            while (rowIterator.hasNext()) {
                row = rowIterator.next();
                String idPlan           = String.valueOf(row.getCell(0));
                String idCurso          = String.valueOf(row.getCell(1));
                Integer ciclo           = (int) Double.parseDouble(String.valueOf(row.getCell(2)));
                String especialidad     = String.valueOf(row.getCell(3));
                String descripcion      = String.valueOf(row.getCell(4));
                Double creditaje        = Double.parseDouble(String.valueOf(row.getCell(5)));
                String tipo             = String.valueOf(row.getCell(6));
                String grupo            = String.valueOf(row.getCell(7));
                Curso fila = Curso.builder()
                        .idPlan(idPlan)
                        .idCurso(idCurso)
                        .ciclo(ciclo)
                        .especialidad(especialidad)
                        .descripcion(descripcion)
                        .creditaje(creditaje)
                        .tipo(tipo)
                        .grupo(grupo)
                        .build();
                listaFilas.add(fila);
                System.out.println("end");
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
    public void cargarExcel(List<Curso> listaFilas){
        int batchSize = 1000;
        if(listaFilas.size()<=0){
            return;
        }
        try(Connection conn = dataSource.getConnection()){
            conn.setAutoCommit(false);
            try{
                PreparedStatement stmt = conn.prepareStatement(
                        "INSERT INTO MAE_CURSO("+
                                "ID_PLAN	  	," +
                                "ID_CURSO		," +
                                "CICLO	  	," +
                                "ESPECIALIDAD			," +
                                "DESCRIPCION	," +
                                "CREDITAJE			," +
                                "TIPO			," +
                                "GRUPO      " +
                                ") VALUES ("+
                                "?,"+
                                "?,"+
                                "?,"+
                                "?,"+
                                "?,"+
                                "?,"+
                                "?,"+
                                "? "+
                                ")") ;
                int[] idx = { 0 };
                Iterator<Curso> itCurso = listaFilas.iterator();
                Curso curso;
                while(itCurso.hasNext()){
                    curso = itCurso.next();
                    try{
                        TypesUtil.validarBDString(stmt,  1, curso.getIdPlan());
                        TypesUtil.validarBDString(stmt,  2, curso.getIdCurso());
                        TypesUtil.validarBDInteger(stmt, 3, curso.getCiclo()); 
                        TypesUtil.validarBDString(stmt,  4, curso.getEspecialidad());
                        TypesUtil.validarBDString(stmt,  5, curso.getDescripcion());
                        TypesUtil.validarBDDouble(stmt,  6, curso.getCreditaje());
                        TypesUtil.validarBDString(stmt,  7, curso.getTipo());
                        TypesUtil.validarBDString(stmt,  8, curso.getGrupo());
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
