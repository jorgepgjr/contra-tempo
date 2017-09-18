package br.com.contratempo;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;

//@SpringBootApplication(exclude = {
//        org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration.class})
@SpringBootApplication
public class ContraTempoApplication {

	public static void main(String[] args) throws Exception {
        new SpringApplicationBuilder(ContraTempoApplication.class).run(args);
	}
}
