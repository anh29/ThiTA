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
             
    public Integer AddCodeTest(String name_test)
            throws ClassNotFoundException, SQLException {
        return this.testDAO.AddCodeTest(name_test);
    }

    public void addListQuizizzInTest(Integer test_id, String quizizz_id){
        this.testDAO.addListQuizizzInTest(test_id, Integer.parseInt(quizizz_id));
    }

    public ArrayList<Quizizz> getQuizizzInTest(String test_id) throws NumberFormatException, ClassNotFoundException, SQLException{
        return this.testDAO.getQuizizzInTest(Integer.parseInt(test_id));
    }
}
