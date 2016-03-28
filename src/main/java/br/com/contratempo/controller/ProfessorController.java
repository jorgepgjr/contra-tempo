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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.contratempo.entity.Professor;
import br.com.contratempo.repository.ConstantsRepository;
import br.com.contratempo.repository.MatriculaRepository;
import br.com.contratempo.repository.ProfessorRepository;

@Controller
@RequestMapping("/professor")
public class ProfessorController {
	
	@Autowired
    ProfessorRepository repository;
	
	@Autowired
	MatriculaRepository matriculaRepository;
	
	@Autowired
	ConstantsRepository constantsRepository;
	
	ArrayList<Professor> professores;

	//TODO: trocar para PUT e configurar
	@RequestMapping(value="/{id}",  method = RequestMethod.POST)
	public void updateCliente(@PathVariable("id") Long id,@ModelAttribute Professor professor) {
		professor.setId(id);
		this.salvaProfessor(professor);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView consultaCliente(ModelAndView model) {
		professores = (ArrayList<Professor>) repository.findAll();
		model.setViewName("professor/professores");
		model.addObject("professores", professores);
		return model;
	}
	
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam(value="search", required=false) String search, ModelAndView model) {
		List<Professor> professores = new ArrayList<Professor>();		
		if (isNumber(search)) {
			professores.add(repository.findOne(Long.valueOf(search)));			
		}else {
			professores = repository.findByNomeContainingIgnoreCase(search);
		}
		model.setViewName("professor/professor-tabela");
		model.addObject("professores", professores);
		return model;
	}
	
	@RequestMapping(value="/{id}",  method = RequestMethod.GET)
	public ModelAndView detalhesTurma(@PathVariable("id") Long id) {	
		Professor professor = repository.findOne(id);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("professor/professor-detalhe");
		model.addObject("professorDetalhe", professor);
		return model;
	}
	
	private Professor salvaProfessor(Professor professor){
		professor.setTelefone(professor.getTelefone().replaceAll("\\D+","")); //Removendo mask
		professor.setRg(professor.getRg().replaceAll("[^A-Za-z0-9 ]","")); //Removendo mask
		return repository.save(professor);
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