package br.com.contratempo.repository;

import java.util.Calendar;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import br.com.contratempo.entity.Cliente;

public interface ClienteRepository extends CrudRepository<Cliente, Long>{
	
	List<Cliente> findByNomeContainingIgnoreCase(String nome);
	
	
	@Query("select distinct c from Cliente c inner join c.matriculas m  where m.pago = ?1 order by c.nome")
	List<Cliente> findByMatriculasPaga(boolean isPago);
	
	@Query("select c from Cliente c left join c.matriculas m  where m.dtFim < CURRENT_DATE")
	List<Cliente> findByMatriculasVencidas();
	
	@Query("select c from Cliente c where week(?1) = week(c.dataNasc) order by c.dataNasc")
	List<Cliente> findByDataNasc(Calendar calendar);

}
