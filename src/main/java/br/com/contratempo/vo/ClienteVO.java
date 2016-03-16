package br.com.contratempo.vo;

import java.util.List;

import br.com.contratempo.entity.Cliente;
import br.com.contratempo.entity.Matricula;


public class ClienteVO{
	
	private Long matricula;
	private String nome;
	private String email;
	private String telefone;
	private String fotoUrl;
	private List<Matricula> matriculas;
	
	public ClienteVO(Cliente cliente) {
		super();
		this.matricula = cliente.getId();
		this.nome = cliente.getNome();
		this.email = cliente.getEmail();
		this.telefone = cliente.getTelefone();
		this.fotoUrl = cliente.getFotoUrl();
		this.matriculas =  cliente.getMatriculas();
	}
	public Long getMatricula() {
		return matricula;
	}
	public void setMatricula(Long matricula) {
		this.matricula = matricula;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
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
	public String getFotoUrl() {
		return fotoUrl;
	}
	public void setFotoUrl(String fotoUrl) {
		this.fotoUrl = fotoUrl;
	}
	public List<Matricula> getMatriculas() {
		return matriculas;
	}
	public void setMatriculas(List<Matricula> matriculas) {
		this.matriculas = matriculas;
	}
}