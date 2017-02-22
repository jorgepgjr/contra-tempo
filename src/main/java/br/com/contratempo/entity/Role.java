package br.com.contratempo.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;

@Entity
@Data
public class Role implements GrantedAuthority {
	private static final long serialVersionUID = -5638759441805448853L;
	@Id
	private String name;

	@Override
	public String getAuthority() {
		return name;
	}
}
