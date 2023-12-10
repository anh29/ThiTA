package models.bo;

import java.sql.SQLException;
import models.bean.User;
import models.dao.UserDAO;

public class UserBO {
    UserDAO userDAO = new UserDAO();

    public UserBO() {
    }

    public User findUser(String username, String password) throws ClassNotFoundException, SQLException {
        return this.userDAO.findUser(username, password);
    }
}
