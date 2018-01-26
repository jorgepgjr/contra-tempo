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

import br.com.contratempo.entity.Cliente;
import br.com.contratempo.entity.Matricula;
import br.com.contratempo.entity.Turma;
import br.com.contratempo.repository.ClienteRepository;
import br.com.contratempo.repository.ConstantsRepository;
import br.com.contratempo.repository.MatriculaRepository;
import br.com.contratempo.vo.ClienteVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import static java.util.Objects.isNull;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController {

    @Autowired
    ClienteRepository repository;

    @Autowired
    MatriculaRepository matriculaRepository;

    @Autowired
    ConstantsRepository constantsRepository;

    ArrayList<Cliente> clientes;

    @GetMapping
    public ModelAndView login(Model model) {
        ModelAndView retorno = new ModelAndView("usuario/usuario-cadastro :: usuario-cadastro"); // TODO: mudar pagina
        return retorno;
    }
}