package br.com.contratempo.entity;

import java.util.Calendar;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Tabela principal do sistema. Representa o ingresso de um aluno em um curso.
 * Uma Matricula e representada por um Cliente, uma Turma e datas de vigencia. 
 * Cada cliente pode ter mais de uma matricula para a mesma turma com tanto que as datas de vigência nao batam.
 * @author Jorge.
 */
@Entity
@Data
@NoArgsConstructor
public class Matricula{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne
	private Cliente cliente;
	@ManyToOne
	private Turma turma;
	@OneToMany(mappedBy="matricula")
	private List<Movimento> movimentos;
	/**
	 * Vigencia dessa matricula
	 */
	private Calendar dtInicio;	
	private Calendar dtFim;
	private Double valor;
	private boolean ativa;
	private boolean pago;
	/**
	 * Usado para os testes, clona uma matricula
	 * @param matricula
	 */
	public Matricula(Matricula matricula) {
		this.cliente = matricula.cliente;
		this.turma = matricula.turma;
		this.dtInicio = matricula.dtInicio;
		this.dtFim = matricula.dtFim;
		this.valor = matricula.valor;
		this.ativa = matricula.ativa;
		this.pago = matricula.pago;
	}
}