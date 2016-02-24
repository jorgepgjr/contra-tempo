package br.com.contratempo.entity;

import java.util.Calendar;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Cliente{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String nome;
	private String rg;
	private String endereco;
	private String email;
	private String telefone;
	private String profissao;
	private String comoConheceu;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Calendar dataNasc;
	private char sexo;
	private String fotoUrl;
	private Calendar dtCadastro;
	@OneToMany
	private List<Matricula> matriculas;
	
	public Cliente(String nome, String email, String telefone, String fotoUrl) {
		super();
		this.nome = nome;
		this.email = email;
		this.telefone = telefone;
		this.fotoUrl = fotoUrl;
	}
	
	public Cliente() {
		super();
	}

	public Calendar getDtCadastro() {
		return dtCadastro;
	}

	public void setDtCadastro(Calendar dtCadastro) {
		this.dtCadastro = dtCadastro;
	}

	public String getFotoUrl() {
		return fotoUrl;
	}


	public void setFotoUrl(String fotoUrl) {
		this.fotoUrl = fotoUrl;
	}

	public String getEndereco() {
		return endereco;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getProfissao() {
		return profissao;
	}
	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}
	public String getComoConheceu() {
		return comoConheceu;
	}
	public void setComoConheceu(String comoConheceu) {
		this.comoConheceu = comoConheceu;
	}
	public Calendar getDataNasc() {
		return dataNasc;
	}
	public void setDataNasc(Calendar dataNasc) {
		this.dataNasc = dataNasc;
	}
	public char getSexo() {
		return sexo;
	}
	public void setSexo(char sexo) {
		this.sexo = sexo;
	}
	public Long getMatricula() {
		return id;
	}
	public void setMatricula(Long matricula) {
		this.id = matricula;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}

	public List<Matricula> getMatriculas() {
		return matriculas;
	}

	public void setMatriculas(List<Matricula> matriculas) {
		this.matriculas = matriculas;
	}
	
	
}