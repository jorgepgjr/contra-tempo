package br.com.contratempo.repository;

import br.com.contratempo.entity.Usuario;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UsuarioRepository extends CrudRepository<Usuario, Long>{
	
	Usuario findByUsername(String nome);
	Usuario findByEmail(String email);

}
