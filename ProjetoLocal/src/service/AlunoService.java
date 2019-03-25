package service;

import java.io.Serializable;

import dao.AlunoDAO;
import model.Aluno;

public class AlunoService implements Serializable{

	AlunoDAO dao;
	
	public AlunoService() {
		dao = new AlunoDAO();
	}
	
	public void create(Aluno aluno) {
		dao.create(aluno);
	}
	
	public void update(Aluno aluno) {
		dao.update(aluno);
	}
	
	public void delete(Aluno aluno) {
		dao.delete(aluno);
	}
	
	public Aluno load(Aluno aluno) {
		return dao.load(aluno);
	}
}
