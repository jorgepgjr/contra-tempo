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
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.contratempo.entity.Cliente;
import br.com.contratempo.entity.Matricula;
import br.com.contratempo.entity.Turma;
import br.com.contratempo.repository.ClienteRepository;
import br.com.contratempo.repository.ConstantsRepository;
import br.com.contratempo.repository.MatriculaRepository;
import br.com.contratempo.vo.ClienteVO;

import static java.util.Objects.isNull;

@Controller
@RequestMapping("/cliente")
public class ClienteController {

    @Autowired
    ClienteRepository repository;

    @Autowired
    MatriculaRepository matriculaRepository;

    @Autowired
    ConstantsRepository constantsRepository;

    ArrayList<Cliente> clientes;

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView cadastraCliente(@ModelAttribute Cliente cliente, @RequestParam(value = "turmas", required = false) List<Turma> turmas, Model model) {
        final Cliente clienteSalvo = this.salvaCliente(cliente);
        if (!isNull(turmas)) {
            turmas.stream().forEach(turma -> {
                Calendar inicio = Calendar.getInstance();
                inicio.set(Calendar.DAY_OF_MONTH, 10);

                Calendar fim = Calendar.getInstance();
                inicio.set(Calendar.DAY_OF_MONTH, 10);
                inicio.add(Calendar.MONTH, 1);

                Matricula matricula = new Matricula();
                matricula.setCliente(clienteSalvo);
                matricula.setValor(turma.getValorPadrao());
                matricula.setDtInicio(inicio);
                matricula.setDtFim(fim);
                matricula.setTurma(turma);
                matriculaRepository.save(matricula);
            });
        }
        return new ModelAndView("aluno/aluno-cadastro-success :: aluno-cadastro-success","cliente",clienteSalvo);
    }

    //TODO: trocar para PUT e configurar
    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public void updateCliente(@PathVariable("id") Long id, @ModelAttribute Cliente cliente) {
        cliente.setId(id);
        this.salvaCliente(cliente);
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView consultaCliente(@ModelAttribute Cliente cliente, ModelAndView model) {
        clientes = (ArrayList<Cliente>) repository.findTop10ByOrderByIdDesc();
        List<ClienteVO> clientesVO = new ArrayList<ClienteVO>();
        for (Cliente cliente2 : clientes) {
            clientesVO.add(new ClienteVO(cliente2));
        }
        model.setViewName("alunos");
        model.addObject("clientes", clientesVO);
        return model;
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView search(@RequestParam(value = "search", required = false) String search, ModelAndView model) {
        List<Cliente> clientes = new ArrayList<Cliente>();
        final List<ClienteVO> clientesVO = new ArrayList<ClienteVO>();
        if (isNumber(search)) {
            Cliente cliente = repository.findOne(Long.valueOf(search));
            if (cliente != null) {
                clientes.add(repository.findOne(Long.valueOf(search)));
            }
        } else {
            clientes = repository.findByNomeContainingIgnoreCase(search);
        }
        if (clientes.size() != 0) {
            for (Cliente cliente2 : clientes) {
                clientesVO.add(new ClienteVO(cliente2));
            }
        }

        model.setViewName("alunos :: aluno-tabela");
        model.addObject("clientes", clientesVO);
        return model;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView detalhesTurma(@PathVariable("id") Long id) {
        Cliente cliente = repository.findOne(id);
        ModelAndView model = new ModelAndView();
        model.setViewName("aluno/aluno-detalhe");
        model.addObject("clienteDetalhe", cliente);
        return model;
    }

    private Cliente salvaCliente(Cliente cliente) {
        //Verificar se não está vazia
        cliente.setTelefone(cliente.getTelefone().replaceAll("\\D+", "")); //Removendo mask
        cliente.setRg(cliente.getRg().replaceAll("[^A-Za-z0-9 ]", "")); //Removendo mask
        return repository.save(cliente);
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