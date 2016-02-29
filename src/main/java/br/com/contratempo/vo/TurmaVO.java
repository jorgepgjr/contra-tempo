package br.com.contratempo.vo;

import java.util.Calendar;
import java.util.List;

import br.com.contratempo.entity.Matricula;
import br.com.contratempo.entity.Modalidade;
import br.com.contratempo.entity.Professor;
import br.com.contratempo.entity.Turma;

public class TurmaVO {

	private Long id;
	private List<Modalidade> modalidades;
	private Professor professor;
	private String sala;
	private String nome;
	private String nivel;
	private Calendar diaEHora;
	
	/**
	 * Para insercao no BD 
	 */
	private int dia;
	private String horario;
	
	
	/*
	 * Detalhes
	 */
	private List<Matricula> matriculas;	

	public int getHora(){
		return Integer.valueOf(horario.split(":")[0]);
	}
	
	public int getMinuto(){
		return Integer.valueOf(horario.split(":")[1]);
	}

	public TurmaVO(Turma turma) {
		super();
		this.id = turma.getId();
		this.modalidades = turma.getModalidades();
		this.professor = turma.getProfessor();
		this.sala = turma.getSala();
		this.nome = turma.getNome();
		this.nivel = turma.getNivel();
		this.diaEHora = turma.getHorario();
		this.matriculas = turma.getMatriculas();
	}

	public TurmaVO() {
		super();
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Matricula> getMatriculas() {
		return matriculas;
	}

	public void setMatriculas(List<Matricula> matriculas) {
		this.matriculas = matriculas;
	}

	public Calendar getDiaEHora() {
		return diaEHora;
	}

	public void setDiaEHora(Calendar diaEHora) {
		this.diaEHora = diaEHora;
	}

}