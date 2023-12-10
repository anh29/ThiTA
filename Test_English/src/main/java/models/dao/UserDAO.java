package models.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.bean.User;
import models.bean.Vocabulary;

public class UserDAO {
    public UserDAO() {
    }

    public PreparedStatement connectionSQL(String sql) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnweb12", "root", "");
        PreparedStatement pstmt = conn.prepareStatement(sql);
        return pstmt;
    }

    public User findUser(String username, String password) throws ClassNotFoundException, SQLException {
		
		String sql = "SELECT * FROM user where username = ? and password = ?";
		PreparedStatement pstmt = this.connectionSQL(sql);
		pstmt.setString(1, username);		
        pstmt.setString(2, password);

		ResultSet rs = pstmt.executeQuery();

        User user = null;
		while (rs.next()) {
            user = new User();
            user.setUserId(rs.getInt("user_id"));
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(rs.getString("email"));
		}

		return user;
	}
}