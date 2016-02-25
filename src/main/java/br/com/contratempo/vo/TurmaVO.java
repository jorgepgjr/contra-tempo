package br.com.contratempo.vo;

import java.util.List;

import br.com.contratempo.entity.Modalidade;
import br.com.contratempo.entity.Professor;

public class TurmaVO {

	private List<Modalidade> modalidades;
	private Professor professor;
	private String sala;
	private String nome;
	private String nivel;
	private int dia;
	private String horario;
	
	public int getHora(){
		return Integer.valueOf(horario.split(":")[0]);
	}
	
	public int getMinuto(){
		return Integer.valueOf(horario.split(":")[1]);
	}

	public List<Modalidade> getModalidades() {
		return modalidades;
	}

	public void setModalidades(List<Modalidade> modalidades) {
		this.modalidades = modalidades;
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public String getSala() {
		return sala;
	}

	public void setSala(String sala) {
		this.sala = sala;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}

	public int getDia() {
		return dia;
	}

	public void setDia(int dia) {
		this.dia = dia;
	}

	public String getHorario() {
		return horario;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}
}