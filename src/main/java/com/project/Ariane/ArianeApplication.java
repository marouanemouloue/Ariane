package com.project.Ariane;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.project.Ariane.api.Repositories.AnomalieRepository")
public class ArianeApplication {

	public static void main(String[] args) {
		SpringApplication.run(ArianeApplication.class, args);
	}

}
