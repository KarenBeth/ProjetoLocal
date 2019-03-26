package model;

import java.util.ArrayList;

/**
*
* @author Grupo PI
*/
public class Grupo {
	
	private int numero;
	private String nome;
	private Professor professor;
	private ArrayList<Aluno> lstAlunos;
	
	public Grupo(int numero, String nome, Professor professor, ArrayList<Aluno> lstAlunos) {
		this.professor = professor;
		this.numero = numero;
		this.nome = nome;
		this.lstAlunos = lstAlunos;
	}
	
	public Professor getProfessor() {
		return professor;
	}
	
	public void setProfessor(Professor professor) {
		this.professor = professor;
	}
	
	public int getNumero() {
		return numero;
	}
	
	public void setNumero(int numero) {
		this.numero = numero;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public ArrayList<Aluno> getAlunos() {
		return lstAlunos;
	}
	public void setAlunos(ArrayList<Aluno> lstAlunos) {
		this.lstAlunos = lstAlunos;
	}
}
