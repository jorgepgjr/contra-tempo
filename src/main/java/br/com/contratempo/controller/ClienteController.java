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
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.contratempo.entity.Cliente;
import br.com.contratempo.entity.Turma;
import br.com.contratempo.repository.ClienteRepository;
import br.com.contratempo.vo.ClienteVO;

@Controller
@RequestMapping("/cliente")
public class ClienteController {
	
	@Autowired
    ClienteRepository repository;
	
	ArrayList<Cliente> clientes;

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView cadastraCliente(@ModelAttribute Cliente cliente, @RequestParam(value="turmas") List<Turma> turmas, Model model) {
		repository.save(cliente);
		return new ModelAndView("redirect:/cliente");
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView consultaCliente(@ModelAttribute Cliente cliente, ModelAndView model) {
		clientes = (ArrayList<Cliente>) repository.findAll();
		List<ClienteVO> clientesVO = new ArrayList<ClienteVO>();
		for (Cliente cliente2 : clientes) {
			clientesVO.add(new ClienteVO(cliente2));
		}
		model.setViewName("lista");
		model.addObject("clientes", clientesVO);
		return model;
	}
	
	@RequestMapping( value="/search", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam(value="search", required=false) String search, ModelAndView model) {
		List<Cliente> clientes = new ArrayList<Cliente>();
		final List<ClienteVO> clientesVO = new ArrayList<ClienteVO>();
		if (isNumber(search)) {
			clientes.add(repository.findOne(Long.valueOf(search)));			
		}else {
			clientes = repository.findByNomeContainingIgnoreCase(search);
		}
		if (clientes.size() != 0) {			
			for (Cliente cliente2 : clientes) {
				clientesVO.add(new ClienteVO(cliente2));
			}
		}

		model.setViewName("tabela-alunos");
		model.addObject("clientes", clientesVO);
		return model;
	}

	private boolean isNumber(String string) {
	    try {
	        Long.parseLong(string);
	    } catch (Exception e) {
	        return false;
	    }
	    return true;
	}
}