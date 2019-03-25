package service;

import java.io.Serializable;

import model.Professor;
import dao.ProfessorDAO;

public class ProfessorService implements Serializable{
	
	ProfessorDAO dao;
	
	public ProfessorService() {
		dao = new ProfessorDAO();
	}
	
	public void createProfessor(Professor professor) {
		dao.create(professor);
	}
	
	public void updateProfessor(Professor professor) {
		dao.update(professor);
	}

	public void deleteProfessor(Professor professor) {
		dao.delete(professor);
	}
	
	public Professor loadProfessor(Professor professor) {
		return dao.load(professor);
	}
	
}
