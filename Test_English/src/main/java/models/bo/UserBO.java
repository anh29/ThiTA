package models.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import models.bean.User;
import models.dao.UserDAO;

public class UserBO {
    UserDAO userDAO = new UserDAO();

    public UserBO() {
    }

    public User findUser(String username, String password) throws ClassNotFoundException, SQLException {
        return this.userDAO.findUser(username, password);
    }
    public void createUser(String username, String password, String email) throws ClassNotFoundException, SQLException {
    	this.userDAO.createUser(username, password, email);
    }
    
    public ArrayList<String> getAllUsername() throws ClassNotFoundException, SQLException {
    	return this.userDAO.getListUsername();
    }
    public ArrayList<String> getAllEmail() throws ClassNotFoundException, SQLException {
    	return this.userDAO.getListEmail();
    }
}
