package br.com.contratempo.repository;

import br.com.contratempo.entity.Role;
import org.springframework.data.repository.CrudRepository;

public interface RoleRepository extends CrudRepository<Role, Long>{
	Role findByName(String role);

}
