package br.com.contratempo.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.contratempo.entity.Constants;

public interface ConstantsRepository extends CrudRepository<Constants, Long>{
	
	Constants findByNomeContainingIgnoreCase(String nome);
}
