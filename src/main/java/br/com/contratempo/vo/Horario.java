package br.com.contratempo.vo;

import br.com.contratempo.entity.Cliente;


public class Horario{
	
	private Long matricula;
	private String nome;
	private String email;
	private String telefone;
	private String fotoUrl;
	
	public Horario(Cliente cliente) {
		super();
		this.matricula = cliente.getMatricula();
		this.nome = cliente.getNome();
		this.email = cliente.getEmail();
		this.telefone = cliente.getTelefone();
		this.fotoUrl = cliente.getFotoUrl();
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
}