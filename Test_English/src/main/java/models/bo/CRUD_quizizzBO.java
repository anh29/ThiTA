package models.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import models.bean.Quizizz;
import models.dao.CRUD_quizizzDAO;

public class CRUD_quizizzBO {
    CRUD_quizizzDAO quizizzDAO = new CRUD_quizizzDAO();

    public CRUD_quizizzBO() {
    }

    public ArrayList<Quizizz> getQuizizzList() throws ClassNotFoundException, SQLException {
        return this.quizizzDAO.getQuizizzList();
    }

    public void addQuizizz(String question, String answer_a, String answer_b, String answer_c, String answer_d, String answer, String explaination) {
        this.quizizzDAO.addQuizizz(question, answer_a, answer_b, answer_c, answer_d, answer, explaination);
    }

    public Quizizz getQuizizzDetail(String quizizz_id) {
        return this.quizizzDAO.getQuizizzDetail(Integer.parseInt(quizizz_id));
    }

    public void updateQuizizz(String quizizz_id, String question, String answer_a, String answer_b, String answer_c, String answer_d, String answer, String explaination) {
        this.quizizzDAO.updateQuizizz(Integer.parseInt(quizizz_id), question, answer_a, answer_b, answer_c, answer_d, answer, explaination);
    }

    public void deleteQuizizz(String quizizz_id) {
        this.quizizzDAO.deleteQuizizz(Integer.parseInt(quizizz_id));
    }

    public ArrayList<Quizizz> seekingQuizizz(String question) {
        return this.quizizzDAO.seekingQuizizz(question);
    }
}
