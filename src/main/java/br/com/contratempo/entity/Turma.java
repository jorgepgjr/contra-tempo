package br.com.contratempo.entity;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.contratempo.vo.TurmaVO;

@Entity
public class Turma {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToMany
	private List<Modalidade> modalidades;
	@OneToOne
	private Professor professor;
	private String sala;
	private String nome;	
	/**
	 * Baseado na primeira semana de maio de 2016 onde o dia 1 == Domingo e o dia 7 == Sabado
	 */
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar horario;
	private boolean ativa;	
	private String nivel;

	public Turma() {
		super();
	}
	
	public Turma(TurmaVO turmaVO) {
		super();
		this.modalidades = turmaVO.getModalidades();
		this.professor = turmaVO.getProfessor();
		this.sala = turmaVO.getSala();
		this.nome = turmaVO.getNome();
		this.nivel = turmaVO.getNivel();
		this.ativa = true;
		this.horario = new GregorianCalendar(2016, Calendar.MAY, turmaVO.getDia(),turmaVO.getHora(),turmaVO.getMinuto());
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Modalidade> getModalidades() {
		return modalidades;
	}

	public void setModalidades(List<Modalidade> modalidade) {
		this.modalidades = modalidade;
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Calendar getHorario() {
		return horario;
	}

	public void setHorario(Calendar horario) {
		this.horario = horario;
	}

	public boolean isAtiva() {
		return ativa;
	}

	public void setAtiva(boolean ativa) {
		this.ativa = ativa;
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}

	public String getSala() {
		return sala;
	}

	public void setSala(String sala) {
		this.sala = sala;
	}

}