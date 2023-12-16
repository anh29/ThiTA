package models.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.bean.CodeTest;
import models.bean.Quizizz;

public class CR_testDAO {
    public CR_testDAO() {
    }

    public PreparedStatement connectionSQL(String sql) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnweb12", "root", "");
        PreparedStatement pstmt = conn.prepareStatement(sql);
        return pstmt;
    }

    public ArrayList<CodeTest> getCodeTest() throws ClassNotFoundException, SQLException {
        ArrayList<CodeTest> result = new ArrayList();
        String sql = "SELECT * FROM code_test";
        PreparedStatement pstmt = this.connectionSQL(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            CodeTest codeTest = new CodeTest();
            codeTest.setId(rs.getInt("ID"));
            codeTest.setName(rs.getString("Name"));
            result.add(codeTest);
        }
        return result;
    }

    public ArrayList<Quizizz> getQuizizzInTest(Integer test_id) throws ClassNotFoundException, SQLException {
        ArrayList<Quizizz> result = new ArrayList();
        String sql = "SELECT * FROM test, quizizz where test_id = ? and test.quizizz_id = quizizz.quizizz_id";
        PreparedStatement pstmt = this.connectionSQL(sql);
        pstmt.setInt(1, test_id);
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
}
