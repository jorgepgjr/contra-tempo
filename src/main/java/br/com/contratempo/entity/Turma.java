package br.com.contratempo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Turma {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@OneToOne
	private Modalidade modalidade;
	@OneToOne
	private Professor professor;
	private Double valor;	
	// TODO:horario

	public Turma() {
		super();
	}

	public Double getValor() {
		return valor;
	}


	public void setValor(Double valor) {
		this.valor = valor;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Modalidade getModalidade() {
		return modalidade;
	}

	public void setModalidade(Modalidade modalidade) {
		this.modalidade = modalidade;
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}
}
