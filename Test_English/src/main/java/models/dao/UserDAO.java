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
        Class.forName("com.mysql.jdbc.Driver");
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
    public void createUser(String username, String password, String email) throws ClassNotFoundException, SQLException {
    	
		String sql = "INSERT INTO user(username, password, email) VALUES(?, ?, ?)";
		PreparedStatement pstmt = this.connectionSQL(sql);
		pstmt.setString(1, username);		
        pstmt.setString(2, password);
        pstmt.setString(3, email);
		pstmt.executeUpdate();
	}
    
    public ArrayList<String> getListUsername() throws ClassNotFoundException, SQLException {
    	ArrayList<String> listUsername = new ArrayList<String>();
    	String sql = "Select username FROM user";
    	PreparedStatement pstmt = this.connectionSQL(sql);
    	
    	ResultSet rs = pstmt.executeQuery();
    	while(rs.next()) {
    		listUsername.add(rs.getString("username"));
    	}
    	return listUsername;
    }
    public ArrayList<String> getListEmail() throws ClassNotFoundException, SQLException {
    	ArrayList<String> listEmail = new ArrayList<String>();
    	String sql = "Select email FROM user";
    	PreparedStatement pstmt = this.connectionSQL(sql);
    	
    	ResultSet rs = pstmt.executeQuery();
    	while(rs.next()) {
    		listEmail.add(rs.getString("email"));
    	}
    	return listEmail;
    }
}