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

import br.com.contratempo.entity.Usuario;
import br.com.contratempo.repository.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/usuario")
public class UsuarioController {

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

	@GetMapping("/cadastro")
	public ModelAndView login(Model model) {
        ModelAndView retorno = new ModelAndView("usuario/usuario-cadastro :: usuario-cadastro");
        retorno.addObject("usuarios",usuarioRepository.findAll());
		return retorno;
	}

    @PostMapping("/novo")
    public ModelAndView criaUsuario(@Valid Usuario usuario) {
        if (usuarioRepository.findByUsername(usuario.getUsername()) != null){
            log.debug("Usuário {} já encontrado na base", usuario.getUsername());
        } else if (usuarioRepository.findByEmail(usuario.getEmail()) != null){
            log.debug("Email {} já cadastrado na base", usuario.getEmail());
        } else {
            usuario.setPassword(bCryptPasswordEncoder.encode(usuario.getPassword()));
            usuarioRepository.save(usuario);
        }
        ModelAndView retorno = new ModelAndView("usuario/usuario-cadastro-success");
        retorno.addObject("usuario", usuario);
        return retorno;
    }

}