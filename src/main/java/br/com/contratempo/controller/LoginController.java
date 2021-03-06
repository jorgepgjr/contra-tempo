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

import br.com.contratempo.entity.*;
import br.com.contratempo.repository.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.*;

@Slf4j
@Controller
public class LoginController {

	@Autowired
	private ConstantsRepository constantsRepository;
	
	@Autowired
	private ModalidadeRepository modalidadeRepository;
	
	@Autowired
	private ProfessorRepository professorRepository;
	
	@Autowired
	private TurmaRepository turmaRepository;
	
	@Autowired
	private ClienteRepository clienteRepository;
	
	@Autowired
	private MatriculaRepository matriculaRepository;

	@Autowired
	private UsuarioRepository usuarioRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private RoleRepository roleRepository;

	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("usuario", new Usuario());
		return "login";
	}
	
	@GetMapping({"/home", "/"})
	public ModelAndView home(ModelAndView model) {
		this.populaOBanco();

		List<Turma> turmas = (List<Turma>) turmaRepository.findAll();
		List<Cliente> clientes = clienteRepository.findByMatriculasPaga(false);
		List<Cliente> aniversariantes = clienteRepository.findByDataNasc(Calendar.getInstance());
		
//		Calendar cal = Turma.getDefaultHorario(Calendar.getInstance().get(Calendar.DAY_OF_WEEK));
//		List<Turma> turmasDoDia = turmaRepository.findTurmasDoDia(cal);
		
		model.setViewName("home");
		model.addObject("turmas", turmas);
		model.addObject("clientes", clientes);
		model.addObject("aniversariantes", aniversariantes);

		return model;
	}
	
	@RequestMapping("/about")
	public String about() {
		return "about";
	}

	@RequestMapping("/cheat")
	public String cheat() {
		if (usuarioRepository.findByUsername("jorgepgjr") == null ){
			final Usuario jorge = new Usuario();
			jorge.setNome("Jorge Peres Guimarães Junior");
			jorge.setPassword(bCryptPasswordEncoder.encode("123"));
			jorge.setEmail("jorgepgjr@gmail.com");
			jorge.setUsername("jorgepgjr");

			Role role = roleRepository.save(Role.ROLE_ADMIN);
			jorge.addRole(role);
			Usuario save = usuarioRepository.save(jorge);

			log.error("Criado {} ", save);
		}
		return "login";
	}

	//TODO: Remover quando for rodar a aplicacao
	private void populaOBanco(){
		List<Modalidade> modalidades = (List<Modalidade>) modalidadeRepository.findAll();
		if (modalidades.size() == 0){
			roleRepository.save(Role.ROLE_SECRETARIA);
			modalidadeRepository.save(new Modalidade("Samba de Gafiera"));
			modalidadeRepository.save(new Modalidade("Forro"));
			modalidadeRepository.save(new Modalidade("Bolero"));
			modalidadeRepository.save(new Modalidade("Zouk"));
			modalidades = (ArrayList<Modalidade>) modalidadeRepository.findAll();
			Constants constants = new Constants();
			constants.setNome(Constants.VALOR_TURMA_PADRAO);
			constants.setValor("75");
			constantsRepository.save(constants);
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
			turma1.setValorPadrao(75D);
			
			turma2.setProfessor(professorRepository.findOne(2L));
			turma2.setModalidades(modalidadesTurma);
			turma2.setNome("Dança de Salão 1");
			turma2.setHorario(new GregorianCalendar(2016, Calendar.MAY, 2,21,30));
			turma2.setNivel("1");
			turma2.setSala(Turma.SALA2);
			turma1.setValorPadrao(70D);

			turmaRepository.save(turma1);
			turmaRepository.save(turma2);
		}
		if (clienteRepository.count() == 0) {
			clienteRepository.save(new Cliente("Jorge Peres", "jorgepgjr@gmail.com", "13997295671", ""));
			clienteRepository.save(new Cliente("Dora Magno", "minhaSogra@gmail.com", "11997295671", ""));
			clienteRepository.save(new Cliente("Aercio Peres Magno", "amoOJorge@gmail.com", "1191132123", ""));
			clienteRepository.save(new Cliente("Erika Magno","329148780","Rua Tocantins 77 apt 171","jorgepgjr@gmail.com","11997295671",
					"Dancarina","internet",Calendar.getInstance(),'F',"",Calendar.getInstance()));
			clienteRepository.save(new Cliente("Jorge Full","312312312312","Rua Tocantins 77 apt 171","jorgepgjr@gmail.com","1132139123",
					"Reporter","internet",Calendar.getInstance(),'M',"http://graph.facebook.com/v2.5/100000160917760/picture",Calendar.getInstance()));
		}
		
		if(matriculaRepository.count() == 0){
			Calendar vencimento = Calendar.getInstance();
			vencimento.add(Calendar.DAY_OF_MONTH, -1);
			
			Calendar today = Calendar.getInstance();
			today.add(Calendar.MONTH, -2);
			
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
			matricula3.setTurma(turmaRepository.findOne(1L));
			matricula3.setPago(true);
			
			Matricula matricula4 = new Matricula(matricula);
			matricula4.setCliente(clienteRepository.findOne(3L));
			matricula4.setTurma(turmaRepository.findOne(2L));
			matricula4.setPago(false);
			matricula4.setDtFim(Calendar.getInstance());
			
			Matricula matricula5 = new Matricula(matricula);
			matricula5.setCliente(clienteRepository.findOne(4L));
			matricula5.setTurma(turmaRepository.findOne(1L));
			matricula5.setPago(false);
			
			Matricula matricula6 = new Matricula(matricula);
			matricula6.setCliente(clienteRepository.findOne(3L));
			matricula6.setTurma(turmaRepository.findOne(2L));
			matricula6.setPago(true);
			
			matriculaRepository.save(matricula);
			matriculaRepository.save(matricula2);
			matriculaRepository.save(matricula3);
			matriculaRepository.save(matricula4);
			matriculaRepository.save(matricula5);
			matriculaRepository.save(matricula6);
		}
	}
}