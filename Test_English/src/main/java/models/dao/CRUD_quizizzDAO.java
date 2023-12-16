package models.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.bean.Quizizz;

public class CRUD_quizizzDAO {
	public CRUD_quizizzDAO() {
	}

	public PreparedStatement connectionSQL(String sql) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnweb12", "root", "");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		return pstmt;
	}

	public ArrayList<Quizizz> getQuizizzList() throws ClassNotFoundException, SQLException {
	ArrayList<Quizizz> result = new ArrayList();
		String sql = "SELECT * FROM quizizz";
		PreparedStatement pstmt = this.connectionSQL(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Quizizz quizizz = new Quizizz();
			quizizz.setQuizizzId(rs.getInt("quizizz_id"));
			quizizz.setQuestion(rs.getString("question"));
			quizizz.setAnswerA(rs.getString("answer_a"));
			quizizz.setAnswerB(rs.getString("answer_b"));
			quizizz.setAnswerC(rs.getString("answer_c"));
			quizizz.setAnswerD(rs.getString("answer_d"));
			quizizz.setAnswer(rs.getString("answer"));
			quizizz.setExplaination(rs.getString("explaination"));
			result.add(quizizz);
		}
		return result;
	}
	public void addQuizizz(String question, String answer_a, String answer_b, String answer_c, String answer_d, String answer, String explaination) {
		try {
			String sql = "INSERT INTO quizizz (question, answer_a, answer_b, answer_c, answer_d, answer, explaination) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = this.connectionSQL(sql);
			pstmt.setString(1, question);
			pstmt.setString(2, answer_a);
			pstmt.setString(3, answer_b);
			pstmt.setString(4, answer_c);
			pstmt.setString(5, answer_d);
			pstmt.setString(6, answer);
			pstmt.setString(7, explaination);
	
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException var7) {
			var7.printStackTrace();
		}
	}
	

	public Quizizz getQuizizzDetail(int quizizz_id) {
	Quizizz quizizz = null;

		try {
			String sql = "SELECT * FROM quizizz where quizizz_id=?";
			PreparedStatement pstmt = this.connectionSQL(sql);
			pstmt.setInt(1, quizizz_id);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				quizizz = new Quizizz();
				quizizz.setQuizizzId(rs.getInt("quizizz_id"));
				quizizz.setQuestion(rs.getString("question"));
				quizizz.setAnswerA(rs.getString("answer_a"));
				quizizz.setAnswerB(rs.getString("answer_b"));
				quizizz.setAnswerC(rs.getString("answer_c"));
				quizizz.setAnswerD(rs.getString("answer_d"));
				quizizz.setAnswer(rs.getString("answer"));
				quizizz.setExplaination(rs.getString("explaination"));
			
			}
		} catch (ClassNotFoundException | SQLException var6) {
			var6.printStackTrace();
		}

		return quizizz;
	}

	public void updateQuizizz(int quizizz_id, String question, String answer_a, String answer_b, String answer_c, String answer_d, String answer, String explaination) {
		try {
			String sql = "UPDATE quizizz SET question=?, answer_a=?, answer_b=?, answer_c=?, answer_d=?, answer=?, explaination=? WHERE quizizz_id=?";
			PreparedStatement pstmt = this.connectionSQL(sql);
			pstmt.setString(1, question);
			pstmt.setString(2, answer_a);
			pstmt.setString(3, answer_b);
			pstmt.setString(4, answer_c);
			pstmt.setString(5, answer_d);
			pstmt.setString(6, answer);
			pstmt.setString(7, explaination);
			pstmt.setInt(8, quizizz_id);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException var7) {
			var7.printStackTrace();
		}
	}
	

	public void deleteQuizizz(int quizizz_id) {
		try {
			String sql = "DELETE FROM quizizz WHERE quizizz_id=?";
			PreparedStatement pstmt = this.connectionSQL(sql);
			pstmt.setInt(1, quizizz_id);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException var4) {
			var4.printStackTrace();
		}
	}

	public ArrayList<Quizizz> seekingQuizizz(String infor) {
	ArrayList<Quizizz> result = new ArrayList();

		try {
			String sql = "SELECT * FROM quizizz WHERE question LIKE CONCAT('%', ?, '%')";
			PreparedStatement pstmt = this.connectionSQL(sql);
			pstmt.setString(1, infor);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Quizizz quizizz = new Quizizz();
				quizizz.setQuizizzId(rs.getInt("quizizz_id"));
				quizizz.setQuestion(rs.getString("question"));
				quizizz.setAnswerA(rs.getString("answer_a"));
				quizizz.setAnswerB(rs.getString("answer_b"));
				quizizz.setAnswerC(rs.getString("answer_c"));
				quizizz.setAnswerD(rs.getString("answer_d"));
				quizizz.setAnswer(rs.getString("answer"));
				quizizz.setExplaination(rs.getString("explaination"));
			
				result.add(quizizz);
			}
		} catch (ClassNotFoundException | SQLException var8) {
			var8.printStackTrace();
		}
		return result;
	}
}
