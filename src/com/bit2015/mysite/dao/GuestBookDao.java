package com.bit2015.mysite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit2015.mysite.vo.GuestBookVo;

public class GuestBookDao {
	
	public Connection getConnection()throws SQLException
	{
		Connection connection =null;
		try{
			//1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2. 커넥션 만들기
			String dbURL= "jdbc:oracle:thin:@localhost:1521:xe";
			
			connection=DriverManager.getConnection(dbURL, "webdb","webdb");

		}catch(ClassNotFoundException ex){
			System.out.println("드라이버 로딩실패: "+ex);
		}
		return connection;
	
	}
	public void insert(GuestBookVo vo){
		//1. 연결
		try{
		Connection connection = getConnection();
		
		//2. Statement 준바
		String sql =
				"insert "+
				"into GuestBook "+
				"values(GuestBook_seq.nextval, ?, ?, ?, SYSDATE)";
		PreparedStatement gstmt = connection.prepareStatement(sql);
		//3. binding
		gstmt.setString(1, vo.getName());
		gstmt.setString(2, vo.getPassword());
		gstmt.setString(3, vo.getMessage());
		
		//4. 실행
		gstmt.executeUpdate();
	
		}catch(SQLException ex){
			System.out.println("SQL 오류 : "+ex);
			
		}
	}	
	public void delete(String no, String password){
		
		try{
			Connection connection = getConnection();
			
			//2. Statement 준바
			String sql =
					"delete from GuestBook where NO=? AND PASSWORD=? ";
			Long num = Long.parseLong(no);		
			PreparedStatement gstmt = connection.prepareStatement(sql);
			//3. binding
			gstmt.setLong(1, num);
			gstmt.setString(2, password);
			
			//4. 실행
			gstmt.executeUpdate();
		
			}catch(SQLException ex){
				System.out.println("SQL 오류 : "+ex);
				
			}
		
	}
	
	public List<GuestBookVo> getList(){
		List<GuestBookVo> list = new ArrayList<GuestBookVo>();
		try{
			//1. 연결
			Connection connection = getConnection();
			//2. Statement
			Statement gstmt = connection.createStatement();
			//3. sql문 실행
			String sql = "select * from GuestBook order by no desc";
			ResultSet rs = gstmt.executeQuery(sql);
			
			while(rs.next()){
		
				Long no= rs.getLong(1);
				String name = rs.getString(2);
				String password = rs.getString(3);
				String message = rs.getString(4);
				String date = rs.getString(5);
				
				GuestBookVo vo = new GuestBookVo();
				
				vo.setNo(no);
				vo.setName(name);
				vo.setPassword (password);
				vo.setDate(date);
				vo.setMessage(message);
				
				list.add(vo);
			}
			rs.close();
			gstmt.close();
			connection.close();
		
			
		}catch(SQLException ex){
			System.out.println("SQL오류-"+ex);
			
		}
		return list;
	}

}
