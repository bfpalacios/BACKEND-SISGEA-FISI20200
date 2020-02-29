package edu.taller.sisgea.procesos.service.plan;

import ob.commons.error.model.ErrorResponse;
import ob.commons.mantenimiento.service.IMantenibleService;
import edu.taller.sisgea.procesos.model.Plan;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface IPlanService extends IMantenibleService<Plan> {
	
	List<Plan> buscarTodosPlan();
	
	Plan buscarPlan(String idPlan);
	
	List<ErrorResponse> cargarArchivos(List<MultipartFile> multipartfiles);
	
}