package models.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import models.bean.RecordTest;

public class CR_recordTestDAO {

    public PreparedStatement connectionSQL(String sql) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnweb12", "root", "");
        PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        return pstmt;
    }

    public void addRecordTest(int testId, int studentId, int quizizzId, String studentAnswer, String wordDay)
            throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO record_test (test_id, student_id, quizizz_id, student_answer, word_day) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = this.connectionSQL(sql);
        pstmt.setInt(1, testId);
        pstmt.setInt(2, studentId);
        pstmt.setInt(3, quizizzId);
        pstmt.setString(4, studentAnswer);
        pstmt.setString(5, wordDay);

        pstmt.executeUpdate();
    }

    public ArrayList<RecordTest> getRecordTests(Integer student_id, String date) throws ClassNotFoundException, SQLException {
        ArrayList<RecordTest> recordTests = new ArrayList<>();

        String sql = "SELECT DISTINCT * FROM record_test, code_test, quizizz WHERE record_test.test_id = code_test.ID AND record_test.quizizz_id = quizizz.quizizz_id AND word_day = ? and student_id=?;";
        PreparedStatement pstmt = this.connectionSQL(sql);
        pstmt.setString(1, date);
        pstmt.setInt(2, student_id);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            RecordTest recordTest = new RecordTest();
            recordTest.setRecordId(rs.getInt("record_id"));
            recordTest.setTestId(rs.getInt("test_id"));
            recordTest.setStudentId(rs.getInt("student_id"));
            recordTest.setQuizizzId(rs.getInt("quizizz_id"));
            recordTest.setStudentAnswer(rs.getString("student_answer"));
            recordTest.setWordDay(rs.getString("word_day"));
            recordTest.setQuestion(rs.getString("question"));
            recordTest.setCorrectAnswer(rs.getString("answer"));
            recordTest.setNameTest(rs.getString("Name"));
            recordTests.add(recordTest);
        }
        return recordTests;
    }

    public ArrayList<RecordTest> getAllRecordTestsFollowingDateAndTestId(int student_id) throws ClassNotFoundException, SQLException {
        ArrayList<RecordTest> recordTests = new ArrayList<>();

        String sql = "SELECT DISTINCT record_test.test_id, record_test.word_day, code_test.Name FROM record_test JOIN code_test ON record_test.test_id = code_test.ID WHERE record_test.student_id = ?;";
        PreparedStatement pstmt = this.connectionSQL(sql);
        pstmt.setInt(1, student_id);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            RecordTest recordTest = new RecordTest();
            recordTest.setTestId(rs.getInt("test_id"));
            recordTest.setWordDay(rs.getString("word_day"));
            recordTest.setNameTest(rs.getString("Name"));
            recordTests.add(recordTest);
        }
        return recordTests;
    }
}
