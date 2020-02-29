package edu.taller.sisgea.mantenimientosgenerales.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Solicitud {
	
	private Integer idSolicitud;
	private Integer idEspacioAcademico;
	private String descripcionEspacioAcademico;
	private Integer idSolicitante;
	private Integer dni;
	private String nombres;
	private String apellidoPaterno;
	private String apellidoMaterno;
	private String estadoSolicitud;
	private String descripcionEstadoSolicitud;
	private String tipoSolicitud;
	private String descripcionTipoSolicitud;
	private String motivo;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date fechaRegistro;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date fechaReserva;
	private String horaInicio;
	private String horaFin;
	private String estadoAsistencia;
	private String pabellon;
	private String descripcionPabellon;
	private String idTipoEspacio;
	private String descripcionTipoEspacio;
	
}
