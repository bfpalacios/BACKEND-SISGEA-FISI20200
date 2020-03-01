package edu.taller.sisgea.seguridad.util;

import java.util.Calendar;
import java.util.Date;

public class DatesUtils {

	private DatesUtils() {
	}

	public static Date sumarRestarHorasFecha(Date fecha, int horas) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(fecha); // Configuramos la fecha que se recibe
		calendar.add(Calendar.HOUR, horas); // numero de horas a aniadir, o restar en caso de horas<0
		return calendar.getTime(); // Devuelve el objeto Date con las nuevas horas añadidas
	}
}
