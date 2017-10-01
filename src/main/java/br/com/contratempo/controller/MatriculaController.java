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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.contratempo.entity.Cliente;
import br.com.contratempo.entity.Matricula;
import br.com.contratempo.repository.ClienteRepository;
import br.com.contratempo.repository.MatriculaRepository;

@Controller
@RequestMapping("/matricula")
public class MatriculaController {
	
	@Autowired
    ClienteRepository repository;
	
	@Autowired
	MatriculaRepository matriculaRepository;
	
	ArrayList<Cliente> clientes;

//	@RequestMapping(method = RequestMethod.POST)
//	public ModelAndView cadastraCliente(@ModelAttribute Cliente cliente, @RequestParam(value="turmas", required=false) List<Turma> turmas, Model model) {
//		this.salvaCliente(cliente);
//		return new ModelAndView("redirect:/cliente");
//	}
//
	@RequestMapping(value="/{id}/pagar",  method = RequestMethod.POST)	
	public ModelAndView pagarMatricula(@PathVariable("id") Long id) {
		Matricula matricula = matriculaRepository.findOne(id);
		matricula.setPago(true);
		matriculaRepository.save(matricula);
		return null;
	}
}