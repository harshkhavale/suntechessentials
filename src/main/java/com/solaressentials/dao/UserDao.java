package com.solaressentials.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.solaressentials.model.User;

public class UserDao {

	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public UserDao(Connection con) {
		this.con = con;

	}

	public User userLogin(String email, String password) {
		User user = null;
		try {

			query = "select * from users where email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return user;
	}
	public int userRegistration(String email,String username, String password) {
		User user = null;
		try {

			query = "insert into users(email,username,password) values(?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, username);

			pst.setString(3, password);
			int rs = pst.executeUpdate();
			if (rs > 0) {
				return 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return 0;
	}

}
