package edu.taller.sisgea.boot.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.ModelAndView;

/**
 * La clase {@code JxlsView} tiene como finalidad proveer una vista aceptable
 * por <b>Spring MVC</b> para la generación de reportes de tipo XLSX.
 * <p>
 * Esta clase extiende de {@link AbstractJxlsView} para poder utilizar la
 * librería <b>JXLS</b>
 * <p>
 * <b>NOTA: </b>Para poder acceder a esta vista es necesario que el método
 * retorne un {@link ModelAndView} estableciendo la vista <b>jxlsView</b> en su
 * constructor.
 */
public class JxlsView extends AbstractJxlsView
{
    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook,
            HttpServletRequest request, HttpServletResponse response)
    {
        throw new UnsupportedOperationException();
    }
}