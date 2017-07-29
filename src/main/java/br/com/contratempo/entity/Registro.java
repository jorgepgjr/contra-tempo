package br.com.contratempo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Registro {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String username;
	private String email;
	private String password;
	private String confirmPassword;

	public Registro(String username, String email) {
		super();
		this.username = username;
		this.email = email;
	}
}
