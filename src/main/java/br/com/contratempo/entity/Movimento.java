
package br.com.contratempo.entity;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Movimento{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String nome;
	private Double valor;
	private Calendar data;
	private char tipo;
	@ManyToOne
	private Matricula matricula;

	public Movimento(String nome) {
		super();
		this.nome = nome;
	}
}
