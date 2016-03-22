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
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.contratempo.entity.Cliente;
import br.com.contratempo.entity.Matricula;
import br.com.contratempo.entity.Modalidade;
import br.com.contratempo.entity.Professor;
import br.com.contratempo.entity.Registro;
import br.com.contratempo.entity.Turma;
import br.com.contratempo.repository.ClienteRepository;
import br.com.contratempo.repository.MatriculaRepository;
import br.com.contratempo.repository.ModalidadeRepository;
import br.com.contratempo.repository.ProfessorRepository;
import br.com.contratempo.repository.RegistroRepository;
import br.com.contratempo.repository.TurmaRepository;
import br.com.contratempo.vo.Login;

@Controller
public class LoginController {
	
	@Autowired
    RegistroRepository repository;
	
	@Autowired
    ModalidadeRepository modalidadeRepository;
	
	@Autowired
	ProfessorRepository professorRepository;
	
	@Autowired
	TurmaRepository turmaRepository;
	
	@Autowired
	ClienteRepository clienteRepository;
	
	@Autowired
	MatriculaRepository matriculaRepository;
	
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
		return "redirect:/home";
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
		modalidadeRepository.deleteAll();
		return this.lista(model);
	}
	
	@RequestMapping("/home")
	public ModelAndView home(ModelAndView model) {
		this.populaOBanco();
		List<Turma> turmas = (List<Turma>) turmaRepository.findAll();
		List<Cliente> clientes = clienteRepository.findByMatriculasProximasDeVencimento();
		List<Cliente> aniversariantes = clienteRepository.findByDataNasc(Calendar.getInstance());
		
		Calendar cal = Turma.getDefaultHorario(Calendar.getInstance().get(Calendar.DAY_OF_WEEK));
		
		List<Turma> turmasDoDia = turmaRepository.findTurmasDoDia(cal);
		model.setViewName("home");
		model.addObject("turmas", turmas);
		model.addObject("clientes", clientes);		
		model.addObject("aniversariantes", aniversariantes);
		model.addObject("turmasDoDia", turmasDoDia);

		return model;
	}
	
	@RequestMapping("/about")
	public String about() {
		return "about";
	}
	
	//TODO: Remover quando for rodar a aplicacao
	private void populaOBanco(){
		List<Modalidade> modalidades = (List<Modalidade>) modalidadeRepository.findAll();
		if (modalidades.size() == 0){			
			modalidadeRepository.save(new Modalidade("Samba de Gafiera"));
			modalidadeRepository.save(new Modalidade("Forro"));
			modalidadeRepository.save(new Modalidade("Bolero"));
			modalidadeRepository.save(new Modalidade("Zouk"));
			modalidades = (ArrayList<Modalidade>) modalidadeRepository.findAll();
		}
		if (professorRepository.count() == 0) {
			professorRepository.save(new Professor("Cristhopher"));
			professorRepository.save(new Professor("Aercio"));
		}
		if (turmaRepository.count() == 0) {
			Turma turma1 = new Turma();
			Turma turma2 = new Turma();
			List<Modalidade> modalidadesTurma = new ArrayList<Modalidade>();
			modalidadesTurma.add(modalidades.get(0));
			modalidadesTurma.add(modalidades.get(1));
			modalidadesTurma.add(modalidades.get(2));
			Calendar date = new GregorianCalendar(2016, Calendar.MAY, 7,20,30);
			
			turma1.setProfessor(professorRepository.findOne(1L));
			turma1.setModalidades(modalidadesTurma);
			turma1.setNome("Dança de Salão");
			turma1.setHorario(date);
			turma1.setNivel("0");
			turma1.setSala(Turma.SALA2);
			
			turma2.setProfessor(professorRepository.findOne(2L));
			turma2.setModalidades(modalidadesTurma);
			turma2.setNome("Dança de Salão 1");
			turma2.setHorario(new GregorianCalendar(2016, Calendar.MAY, 2,21,30));
			turma2.setNivel("1");
			turma2.setSala(Turma.SALA2);

			turmaRepository.save(turma1);
			turmaRepository.save(turma2);
		}
		if (clienteRepository.count() == 0) {
			clienteRepository.save(new Cliente("Jorge Peres", "jorgepgjr@gmail.com", "13997295671", "https://goo.gl/IweKcl"));
			clienteRepository.save(new Cliente("Dora Magno", "minhaSogra@gmail.com", "11997295671", "https://goo.gl/IweKcl"));
			clienteRepository.save(new Cliente("Aercio Peres Magno", "amoOJorge@gmail.com", "1191132123", "https://goo.gl/IweKcl"));			
			clienteRepository.save(new Cliente("Erika Magno","329148780","Rua Tocantins 77 apt 171","jorgepgjr@gmail.com","11997295671",
					"Dancarina","internet",Calendar.getInstance(),'F',"https://goo.gl/IweKcl",Calendar.getInstance()));
			
			
			clienteRepository.save(new Cliente("Jorge Full","312312312312","Rua Tocantins 77 apt 171","jorgepgjr@gmail.com","1132139123",
					"Reporter","internet",Calendar.getInstance(),'M',"http://graph.facebook.com/v2.5/100000160917760/picture",Calendar.getInstance()));
		}
		
		if(matriculaRepository.count() == 0){
			Calendar vencimento = Calendar.getInstance();
			vencimento.add(Calendar.MONTH, 1);
			
			Calendar today = Calendar.getInstance();
			today.set(Calendar.HOUR_OF_DAY, 0);
			
			Matricula matricula = new Matricula();
			matricula.setAtiva(true);
			matricula.setDtInicio(today);
			matricula.setDtFim(vencimento);
			matricula.setPago(true);
			matricula.setCliente(clienteRepository.findOne(1L));
			matricula.setTurma(turmaRepository.findOne(1L));
			matricula.setValor(Double.valueOf(75));
			
			Matricula matricula2 = new Matricula(matricula);
			matricula2.setCliente(clienteRepository.findOne(2L));
			matricula2.setTurma(turmaRepository.findOne(1L));
			matricula2.setPago(false);
			matricula2.setDtFim(Calendar.getInstance());
			
			Matricula matricula3 = new Matricula(matricula);
			matricula3.setCliente(clienteRepository.findOne(3L));
			matricula3.setTurma(turmaRepository.findOne(2L));
			matricula3.setPago(true);
			
			Matricula matricula4 = new Matricula(matricula);
			matricula4.setCliente(clienteRepository.findOne(4L));
			matricula4.setTurma(turmaRepository.findOne(2L));
			matricula4.setPago(false);
			
			matriculaRepository.save(matricula);
			matriculaRepository.save(matricula2);
			matriculaRepository.save(matricula3);
			matriculaRepository.save(matricula4);
		}
		
		
	}

}
