package edu.taller.sisgea.boot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import java.io.File;

public class SisgeaServletInitializer extends SpringBootServletInitializer {
	
	private static final String UBA_SISGEA_CFG = "UBA_SISGEA_CFG";
	private static final String ARCHIVO_APP_PROPERTIES = "application.properties";
	private static Logger log = LoggerFactory.getLogger(SisgeaServletInitializer.class);
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		String rutaArchivoConfigSISGEA = System.getenv(UBA_SISGEA_CFG);
		if (rutaArchivoConfigSISGEA != null) {
			log.info("La variable de entorno {} tiene el valor de {}", UBA_SISGEA_CFG, rutaArchivoConfigSISGEA);
			if (!rutaArchivoConfigSISGEA.endsWith(File.separator)) {
				log.info("Añadiendo separador: {}", File.separator);
				rutaArchivoConfigSISGEA = rutaArchivoConfigSISGEA.concat(File.separator);
			}
			String rutaAppProperties = rutaArchivoConfigSISGEA.concat(ARCHIVO_APP_PROPERTIES);
			log.info("Verificando existencia del archivo de configuración {} definido en la variable de entorno {}",
					rutaAppProperties, UBA_SISGEA_CFG);
			if (new File(rutaAppProperties).exists()) {
				log.info("El archivo de configuración {} existe", rutaAppProperties);
				log.info("Configurando spring.config.location: {}", rutaArchivoConfigSISGEA);
				return application.sources(SisgeaBoot.class).properties(
						"spring.config.location:".concat(rutaArchivoConfigSISGEA));
			} else {
				log.info("El archivo de configuración {} no existe", rutaAppProperties);
				log.info("Cargando archivos de configuración del empaquetado WAR");
				return application.sources(SisgeaBoot.class);
			}
		} else {
			log.info("La variabla de entorno {} no existe", UBA_SISGEA_CFG);
			log.info("Cargando archivos locales de configuración del empaquetado WAR");
			return application.sources(SisgeaBoot.class);
		}
	}
}
