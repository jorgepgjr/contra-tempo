package br.com.contratempo.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Modalidade{
	
	@Id
	private Long id;
	private String nome;
	
}
