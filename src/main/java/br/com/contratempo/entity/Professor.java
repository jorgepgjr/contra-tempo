package br.com.contratempo.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Professor{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String nome;
	private String telefone;
	@OneToMany
	private List<Modalidade> modalidades;
	
	public Professor(String nome) {
		super();
		this.nome = nome;
	}	
	public Professor() {
		super();
	}
	public List<Modalidade> getModalidades() {
		return modalidades;
	}
	public void setModalidades(List<Modalidade> modalidades) {
		this.modalidades = modalidades;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
}
