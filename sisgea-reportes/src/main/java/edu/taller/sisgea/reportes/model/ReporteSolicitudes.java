package edu.taller.sisgea.reportes.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReporteSolicitudes {
	String idSolicitud;
	String idSolicitante;
	String dni;
	String nombreCompleto;
	String idEspacioAcademico;
	String descripcionEspacioAcademico;
	String tipoEspacio;
	String descripcionTipoEspacio;
	String idPabellon;
	String descripcionPabellon;
	String estadoSolicitud;
	String descripcionEstadoSolicitud;
	String tipoSolicitud;
	String descripcionTipoSolicitud;
	String motivo;
	Date fechaRegistro;
	Date fechaReserva;
	String horaInicio;
	String horaFin;
	String estadoAsistencia;
	String descripcionEstadoAsistencia;
	Integer cantidad;
}
