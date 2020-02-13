package edu.taller.sisgea.boot.view;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.http.HttpHeaders;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.AbstractView;

import net.sf.jxls.transformer.XLSTransformer;

/**
 * La clase {@code AbstractJxlsView} tiene como finalidad proveer datos y
 * operaciones comunes para la generación de reportes de tipo XLSX utlizando la
 * librería <b>JXLS</b>.
 * <p>
 * Esta clase extiende de {@link AbstractView} para poder ser extendido por otra
 * clase que defina una vista aceptable por <b>Spring MVC</b>.
 */
public abstract class AbstractJxlsView extends AbstractView
{
    private static final String NOMBRE_REPORTE = "Reporte";
    private static final String MIME_TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    private static final String EXTENSION_XLSX = ".xlsx";
    private static final String RUTA_TEMPLATES = "xlsx/";
    private static final String PARAM_REPORT_NAME = "name";
    private static final String PARAM_REPORT_PARAMS = "params";
    private static final String PARAM_REPORT_TEMPLATE = "template";


    public AbstractJxlsView()
    {
        setContentType(MIME_TYPE);
    }

    /**
     * Ejecuta el renderizado del reporte según el tipo de contenido definido en
     * {@link #setContentType(String)}.
     * 
     * @param model
     *            el {@link ModelMap} establecido en el {@link ModelAndView}
     *            retornado por el método
     * @param request
     *            la actual petición HTTP request
     * @param response
     *            la actual HTTP response
     */
    @SuppressWarnings("unchecked")
    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
            HttpServletResponse response) throws Exception
    {
        model.putIfAbsent(PARAM_REPORT_NAME, NOMBRE_REPORTE);
        String templateExcel = (String) model.get(PARAM_REPORT_TEMPLATE);
        Map<String, Object> reporteParametros = (Map<String, Object>) model
                .get(PARAM_REPORT_PARAMS);
                InputStream stream = getClass().getClassLoader().getResourceAsStream(
                        RUTA_TEMPLATES + templateExcel + EXTENSION_XLSX);
                XLSTransformer xLSTransformer = new XLSTransformer();
                Workbook workbook = xLSTransformer.transformXLS(stream, reporteParametros);
                String nombreReporte = (String) model.get(PARAM_REPORT_NAME);
                response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
                response.setHeader(HttpHeaders.CONTENT_DISPOSITION, 
                        "attachment;filename=" + nombreReporte + EXTENSION_XLSX);
        response.setContentType(getContentType());
        renderReport(workbook, response);
    }

    /**
     * Contruye el reporte XLSX de acuerdo a las especificaciones de la librería
     * <b>JXLSX</b>.
     * <p>
     * <b>NOTA: </b>Actualmente la construcción del reporte se ha delegado al
     * método
     * {@link #renderMergedOutputModel(Map, HttpServletRequest, HttpServletResponse)}.
     * Por tanto este método <b>no participa en la generación del reporte
     * XLSX</b>.
     * 
     * @param model
     *            el {@link ModelMap} establecido en el {@link ModelAndView}
     *            retornado por el método
     * @param workbook
     *            el reporte XLSX
     * @param request
     *            la actual HTTP request
     * @param response
     *            la actual HTTP response
     */
    protected abstract void buildExcelDocument(Map<String, Object> model, Workbook workbook,
            HttpServletRequest request, HttpServletResponse response);

    /**
     * Almacena en <b>response</b> el reporte XLSX construido, a fin de que se
     * ha enviado al navegador del usuario para su descarga y/o visualización.
     * 
     * @param workbook
     *            el reporte XLSX
     * @param response
     *            la actual HTTP response
     * @throws IOException
     *             si existe algún problema durante el proceso de <b>write
     *             out</b> del workbook al response
     */
    protected void renderReport(Workbook workbook, HttpServletResponse response) throws IOException
    {
        workbook.write(response.getOutputStream());
    }

    @Override
    protected boolean generatesDownloadContent()
    {
        return true;
    }
}