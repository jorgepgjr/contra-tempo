package br.com.contratempo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Calendar;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Data
@NoArgsConstructor
public class Cliente{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private Long idLegado;
	private String nome;
	private String rg;
	private String endereco;
	private String email;
	private String telefone;
	private String telefone2;
	private String profissao;
	private String comoConheceu;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Calendar dataNasc;
	private char sexo;
	private String fotoUrl;
	private Calendar dtCadastro;
	private String cidade;
	private String bairro;
	private String estado;
	private String cep;

	@OneToMany(mappedBy= "cliente")
	private List<Matricula> matriculas;
	
	public Cliente(String nome, String email, String telefone, String fotoUrl) {
		super();
		this.nome = nome;
		this.email = email;
		this.telefone = telefone;
		this.fotoUrl = fotoUrl;
	}

	public Cliente(String nome, String rg, String endereco, String email,
			String telefone, String profissao, String comoConheceu,
			Calendar dataNasc, char sexo, String fotoUrl, Calendar dtCadastro) {
		super();
		this.nome = nome;
		this.rg = rg;
		this.endereco = endereco;
		this.email = email;
		this.telefone = telefone;
		this.profissao = profissao;
		this.comoConheceu = comoConheceu;
		this.dataNasc = dataNasc;
		this.sexo = sexo;
		this.fotoUrl = fotoUrl;
		this.dtCadastro = dtCadastro;
	}
}