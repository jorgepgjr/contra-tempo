package br.com.contratempo.repository;

import java.util.Calendar;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import br.com.contratempo.entity.Cliente;

public interface ClienteRepository extends CrudRepository<Cliente, Long>{
	
	List<Cliente> findByNomeContainingIgnoreCase(String nome);
	
	
	@Query("select c from Cliente c right join c.matriculas m  where m.pago = ?1")
	List<Cliente> findByMatriculasPaga(boolean isPago);
	
	@Query("select c from Cliente c left join c.matriculas m  where m.dtFim < CURRENT_DATE")
	List<Cliente> findByMatriculasVencidas();
	
	@Query("select c from Cliente c where month(?1) = month(c.dataNasc)")
	List<Cliente> findByDataNasc(Calendar calendar);

}
