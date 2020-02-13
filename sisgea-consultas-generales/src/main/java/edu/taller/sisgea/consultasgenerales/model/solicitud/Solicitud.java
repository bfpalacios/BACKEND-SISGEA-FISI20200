package edu.taller.sisgea.consultasgenerales.model.solicitud;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Solicitud {
	Integer idSolicitud;
	Integer idEspacioAcademico;
	Integer idSolicitante;
	String estadoSolicitud;
	String tipoSolicitud;
	String motivo;
	Date fechaRegistro;
	Date fechaReserva;
	String horaInicio;
	String horaFin;
	String estadoAsistencia;
}
