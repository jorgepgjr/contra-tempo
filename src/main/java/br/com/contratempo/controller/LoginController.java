/*
 * Copyright 2012-2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package br.com.contratempo.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.contratempo.entity.Cliente;
import br.com.contratempo.entity.Registro;
import br.com.contratempo.repository.RegistroRepository;
import br.com.contratempo.vo.Login;

@Controller
public class LoginController {
	
	@Autowired
    RegistroRepository repository;
	
	ArrayList<Registro> registros;
	
	@Value("${application.message:Hello World}")
	private String message = "Hello World";
	

	@RequestMapping("/validaLogin")
	public String initLogin(@ModelAttribute Login login, Model model) {
		
		System.out.println("TENTATIVA DE LOGIN USUARIO: " + login.getUsername() + "      SENHA: " + login.getPassword());
		if ("jorge".equals(login.getUsername()) && "meuHeroi".equals(login.getPassword())) {
			System.out.println("LOGIN COM SUCESSO");	
		}else {
			System.out.println("FALHA NO ACESSO!!");
		}
		return "home";
	}

	@RequestMapping("/registrar2")
	public ModelAndView initLogin(@ModelAttribute Registro registro, Model model) {		
		System.out.println("REGISTRO: " + registro.getUsername() + "      EMAIL: " + registro.getEmail());
		repository.save(new Registro(registro.getUsername(), registro.getEmail()));
		return this.lista(new ModelAndView());
	}
	
	@RequestMapping("/registrar")
	public ModelAndView initLogin(@ModelAttribute Cliente cliente, Model model) {		
		//		repository.save(new Registro(cliente.getUsername(), registro.getEmail()));
		return this.lista(new ModelAndView());
	}

	@RequestMapping("/lista")
	public ModelAndView lista(ModelAndView model) {
		registros = (ArrayList<Registro>) repository.findAll();
		for (Registro registro : registros) {
			System.out.println("USUARIO: " + registro.getUsername() + "      EMAIL: " + registro.getEmail());
		}
		model.setViewName("lista");
		model.addObject("registros", registros);
		return model;
	}
	
	@RequestMapping("/limpar")
	public ModelAndView limpar(ModelAndView model) {
		repository.deleteAll();
		return this.lista(model);
	}
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "about";
	}

}
