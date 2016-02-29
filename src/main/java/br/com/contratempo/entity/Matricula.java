package br.com.contratempo.entity;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 * Tabela principal do sistema. Representa o ingreco de um aluno em um curso.
 * Uma Matricula e representada por um Cliente, uma Turma e datas de vigencia. 
 * Cada cliente pode ter mais de uma matricula para a mesma turma com tanto que as datas de vigência nao batam.
 * @author Jorge.
 */
@Entity
public class Matricula{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne
	private Cliente cliente;
	@ManyToOne
	private Turma turma;	
	
	/**
	 * Vigencia dessa matricula
	 */
	private Calendar dtInicio;	
	private Calendar dtFim;

	private Double valor;
	private boolean ativa;
	private boolean pago;
	
	public Matricula() {
		super();
	}
		
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


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Turma getTurma() {
		return turma;
	}
	public void setTurma(Turma turma) {
		this.turma = turma;
	}
	public Calendar getDtInicio() {
		return dtInicio;
	}
	public void setDtInicio(Calendar dtInicio) {
		this.dtInicio = dtInicio;
	}
	public Calendar getDtFim() {
		return dtFim;
	}
	public void setDtFim(Calendar dtFim) {
		this.dtFim = dtFim;
	}
	public Double getValor() {
		return valor;
	}
	public void setValor(Double valor) {
		this.valor = valor;
	}
	public boolean isAtiva() {
		return ativa;
	}
	public void setAtiva(boolean ativa) {
		this.ativa = ativa;
	}
	public boolean isPago() {
		return pago;
	}
	public void setPago(boolean pago) {
		this.pago = pago;
	}	
	
}