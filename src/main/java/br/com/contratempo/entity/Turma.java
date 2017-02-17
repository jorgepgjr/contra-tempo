package br.com.contratempo.entity;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.contratempo.vo.TurmaVO;
import lombok.Data;

@Entity
@Data
public class Turma {
	
	public static String SALA1 = "Sala 1";
	public static String SALA2 = "Sala 2";
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToMany
	private List<Modalidade> modalidades;
	
	@ManyToOne
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
	private Double valorPadrao;
	
	@OneToMany(mappedBy= "turma")
	private List<Matricula> matriculas;

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

	/**
	 * Methodo que retorma um calendar apontando para o padrao de horario
	 * TODO: Remover daqui
	 * @return
	 */
	public static Calendar getDefaultHorario(int dayOfWeek){
		return new GregorianCalendar(2016, Calendar.MAY, dayOfWeek);
	}

}