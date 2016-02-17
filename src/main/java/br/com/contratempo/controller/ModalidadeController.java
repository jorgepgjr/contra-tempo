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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.contratempo.entity.Modalidade;
import br.com.contratempo.repository.ModalidadeRepository;

@Controller
@RequestMapping("/modalidade")
public class ModalidadeController {
	
	@Autowired
    ModalidadeRepository repository;
	
	ArrayList<Modalidade> modalidades;

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView cadastraModalidade(@ModelAttribute Modalidade modalidade, Model model) {		
		repository.save(modalidade);
		return new ModelAndView("redirect:/cliente");
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView consultaModalidade(@ModelAttribute Modalidade modalidade, ModelAndView model) {
		modalidades = (ArrayList<Modalidade>) repository.findAll();
		if (modalidades.size() == 0){			
			repository.save(new Modalidade("Samba de Gafiera"));
			repository.save(new Modalidade("Forro"));
			repository.save(new Modalidade("Zouk"));
			repository.save(new Modalidade("Forro 2"));
			modalidades = (ArrayList<Modalidade>) repository.findAll();
		}
		model.setViewName("modalidade");
		model.addObject("modalidades", modalidades);
		return model;
	}
}