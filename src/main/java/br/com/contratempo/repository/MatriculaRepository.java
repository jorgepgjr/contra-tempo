package br.com.contratempo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.com.contratempo.entity.Matricula;

public interface MatriculaRepository extends CrudRepository<Matricula, Long>{

	List<Matricula> findByTurma_id(Long id);
}
