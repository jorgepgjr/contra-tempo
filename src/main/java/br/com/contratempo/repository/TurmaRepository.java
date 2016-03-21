package br.com.contratempo.repository;

import java.util.Calendar;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import br.com.contratempo.entity.Turma;

public interface TurmaRepository extends CrudRepository<Turma, Long>{

	@Query("select t from Turma t where day(?1) = day(t.horario) order by t.horario desc")
	List<Turma> findTurmasDoDia(Calendar calendar); 
}
