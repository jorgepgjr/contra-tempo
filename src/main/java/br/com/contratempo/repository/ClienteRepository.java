package br.com.contratempo.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.contratempo.entity.Cliente;

public interface ClienteRepository extends CrudRepository<Cliente, Long>{

}
