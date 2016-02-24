package br.com.contratempo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.com.contratempo.entity.Professor;

public interface ProfessorRepository extends CrudRepository<Professor, Long>{
	List<Professor> findByNomeContainingIgnoreCase(String nome);

}
