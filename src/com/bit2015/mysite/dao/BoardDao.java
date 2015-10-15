package com.bit2015.mysite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit2015.mysite.vo.BoardVo;

public class BoardDao {

	public Connection getConnection() throws SQLException {
		Connection connection = null;
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2. 커넥션 만들기
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";

			connection = DriverManager.getConnection(dbURL, "webdb", "webdb");

		} catch (ClassNotFoundException ex) {
			System.out.println("드라이버 로딩실패: " + ex);
		}
		return connection;

	}

	public void update(BoardVo vo) {
		try {
			Connection connection = getConnection();

			String sql = "update board set title =?, "
					+ "content =? where no=? ";

			PreparedStatement bstmt = connection.prepareStatement(sql);

			bstmt.setString(1, vo.getTitle());
			bstmt.setString(2, vo.getContent());
			bstmt.setLong(3, vo.getNo());

			bstmt.executeUpdate();
			
			bstmt.close();
			connection.close();
			

			
		} catch (SQLException ex) {
			System.out.println("SQL 오류 : " + ex);
		}
	}

	public BoardVo select(Long bno) {
		BoardVo vo = null;
		try {
			Connection conn = getConnection();
			String sql = "select no, title, content, member_no from board where no=?  ";
			PreparedStatement bstmt = conn.prepareStatement(sql);
			bstmt.setLong(1, bno);

			ResultSet rs = bstmt.executeQuery();

			while (rs.next()) {
				Long no = rs.getLong(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				Long member_no = rs.getLong(4);

				vo = new BoardVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setMember_no(member_no);
				
			}
			rs.close();
			bstmt.close();
			conn.close();

		} catch (SQLException ex) {
			System.out.println("에러얌 " + ex);
		}
		return vo;

	}

	public List<BoardVo> selectBoardList() {

		List<BoardVo> list = new ArrayList<BoardVo>();
		try {
			Connection conn = getConnection();
			Statement bstmt = conn.createStatement();
			String sql = "select a.no, " + "a.title, " + "b.name, "
					+ "a.view_cnt, "
					+ "to_char(a.reg_date, 'yyyy-mm-dd hh24:mi:ss'), "
					+ "b.no "
					+ "from board a, MEMBER b "
					+ "where a.member_no=b.no order by a.reg_date DESC";
			ResultSet rs = bstmt.executeQuery(sql);

			while (rs.next()) {
				Long no = rs.getLong(1);
				String title = rs.getString(2);
				String name = rs.getString(3);
				Long view_cnt = rs.getLong(4);
				String reg_date = rs.getString(5);
				Long bmno = rs.getLong(6);

				BoardVo vo = new BoardVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setMember_name(name);
				vo.setView_cnt(view_cnt);
				vo.setReg_date(reg_date);
				vo.setMember_no(bmno);

				list.add(vo);

			}
			rs.close();
			bstmt.close();
			conn.close();

		} catch (SQLException ex) {
			System.out.println("에러얌 " + ex);
		}
		return list;

	}

	public void insert(BoardVo vo) {
		
		try {
			Connection conn = getConnection();
			String sql = "Insert into board(no,title,content,member_no,view_cnt, reg_date) values( board_no_seq.nextVal, ?, ?, ?,0,SYSDATE)";
			PreparedStatement bstmt = conn.prepareStatement(sql);
		
			bstmt.setString(1, vo.getTitle());
			bstmt.setString(2, vo.getContent());
			bstmt.setLong(3, vo.getMember_no());

			bstmt.executeUpdate();

			bstmt.close();
			conn.close();

		} catch (SQLException ex) {
			System.out.println("에러얌 " + ex);
		}
		
	}
	public void delete(Long bno){
		try {
			Connection conn = getConnection();
			String sql = "delete from board where no= ?";
			PreparedStatement bstmt = conn.prepareStatement(sql);
		
			bstmt.setLong(1, bno);
			
			bstmt.executeUpdate();

			bstmt.close();
			conn.close();

		} catch (SQLException ex) {
			System.out.println("에러얌 " + ex);
		}
	}
	public void increaseViewCount (Long bno){
		try {
			Connection conn = getConnection();
			String sql = "update board set view_cnt= view_cnt+1 where no= ?";
			
			PreparedStatement bstmt = conn.prepareStatement(sql);
		
			bstmt.setLong(1, bno);
			
			bstmt.executeUpdate();

			bstmt.close();
			conn.close();

		} catch (SQLException ex) {
			System.out.println("에러얌 " + ex);
		}
	}
	
}