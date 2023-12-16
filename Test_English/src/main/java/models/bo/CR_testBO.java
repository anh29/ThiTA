package models.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import models.bean.CodeTest;
import models.bean.Quizizz;
import models.bean.User;
import models.dao.CR_testDAO;

public class CR_testBO {
    CR_testDAO testDAO = new CR_testDAO();

    public CR_testBO() {
    }

    public ArrayList<CodeTest> getAllCodeTest()
            throws ClassNotFoundException, SQLException {
        return this.testDAO.getCodeTest();
    }
    public ArrayList<Quizizz> getQuizizzInTest(String test_id) throws NumberFormatException, ClassNotFoundException, SQLException{
        return this.testDAO.getQuizizzInTest(Integer.parseInt(test_id));
    }
}
