package br.com.contratempo.entity;

import java.util.Calendar;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Data
@NoArgsConstructor
public class Professor{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String fotoUrl;
	private String nome;
	private String telefone;
	private String telefone2;
	private String email;
	@OneToMany(mappedBy="professor")
	private List<Turma> turmas;
	private boolean ativo;
	private String cpf;
	private String rg;
	private String endereco;
	private String cidade;
	private String agencia;
	private String contaCorrente;
	private String banco;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Calendar dataNasc;
	
	public Professor(String nome) {
		super();
		this.nome = nome;
	}
}
