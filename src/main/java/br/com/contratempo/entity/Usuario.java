package br.com.contratempo.entity;

import java.util.*;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Data
@NoArgsConstructor
public class Usuario implements UserDetails {

	private static final long serialVersionUID = -1999601982569255029L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String username;
	private String nome;
	@Email
	private String email;
	private String password;
	private boolean enabled = true;
	
	@ManyToMany(fetch = FetchType.EAGER)
	private Set<Role> roles;

	public Usuario(String username, String email) {
		super();
		this.username = username;
		this.email = email;
	}

	public void addRole(Role role){
		if (roles == null){
			roles = new HashSet<>();
		}
		roles.add(role);
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return roles;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

}
