package models.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import models.bean.RecordTest;
import models.dao.CR_recordTestDAO;

public class CR_recordTestBO {
        CR_recordTestDAO recordTestDAO = new CR_recordTestDAO();

    public CR_recordTestBO() {
    }

    public void addRecordTest(String testId, String studentId, String quizizzId, String studentAnswer, String wordDay)
            throws ClassNotFoundException, SQLException {
        this.recordTestDAO.addRecordTest(Integer.parseInt(testId), Integer.parseInt(studentId), Integer.parseInt(quizizzId), studentAnswer, wordDay);
    }
             
    public ArrayList<RecordTest> getRecordTests(String student_id, String date)
            throws ClassNotFoundException, SQLException {
        return this.recordTestDAO.getRecordTests(Integer.parseInt(student_id), date);
    }

        public ArrayList<RecordTest> getAllRecordTestsFollowingDateAndTestId(int student_id)
            throws ClassNotFoundException, SQLException {
        return this.recordTestDAO.getAllRecordTestsFollowingDateAndTestId(student_id);
    }

}
