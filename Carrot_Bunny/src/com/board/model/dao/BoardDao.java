package com.board.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.board.model.vo.Board;
import com.notice.model.vo.Notice;

public class BoardDao {

	private Properties prop = new Properties();
	
	public BoardDao() {
		String filepath = BoardDao.class.getResource("/sql/board_sql.properties").getPath();
		try {
			prop.load(new FileReader(filepath));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBoardList"));
			pstmt.setInt(1, (cPage-1)*numPerPage + 1);
			pstmt.setInt(2,  cPage*numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board b = new Board();
				b.setBoardNumber(rs.getInt("b_num"));
				b.setBoardTitle(rs.getString("b_title"));
				b.setBoardWriter(rs.getString("b_writer"));
				b.setBoardContent(rs.getString("b_content"));
				b.setBoardPrice(rs.getInt("b_price"));
				b.setBoardAmount(rs.getInt("b_amount"));
				b.setBoardIsSell(rs.getInt("b_sell"));
				b.setBoardLike(rs.getString("b_like"));
				b.setBoardIsNego(rs.getInt("b_nego"));
				b.setBoardIsDelete(rs.getInt("b_delete"));
				b.setBoardFilePath(rs.getString("b_original_filename"));
				b.setBoardReFilePath(rs.getString("b_renamed_filename"));
				b.setBoardDate(rs.getDate("b_date"));
				b.setBoardReadCount(rs.getInt("b_readcount"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBoardCount"));
			rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public Board selectBoard(Connection conn, int num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board b = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBoard"));
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				b = new Board();
				b.setBoardNumber(rs.getInt("b_num"));
				b.setBoardTitle(rs.getString("b_title"));
				b.setBoardWriter(rs.getString("b_writer"));
				b.setBoardContent(rs.getString("b_content"));
				b.setBoardPrice(rs.getInt("b_price"));
				b.setBoardAmount(rs.getInt("b_amount"));
				b.setBoardIsSell(rs.getInt("b_sell"));
				b.setBoardLike(rs.getString("b_like"));
				b.setBoardIsNego(rs.getInt("b_nego"));
				b.setBoardIsDelete(rs.getInt("b_delete"));
				b.setBoardFilePath(rs.getString("b_original_filename"));
				b.setBoardReFilePath(rs.getString("b_renamed_filename"));
				b.setBoardDate(rs.getDate("b_date"));
				b.setBoardReadCount(rs.getInt("b_readcount"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}
	
	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertBoard"));
			pstmt.setString(1,b.getBoardTitle());
			pstmt.setString(2,b.getBoardWriter());
			pstmt.setString(3,b.getBoardContent());
			pstmt.setInt(4,b.getBoardPrice());
			pstmt.setInt(5,b.getBoardAmount());
			pstmt.setInt(6,b.getBoardIsNego());
			pstmt.setString(7,b.getBoardFilePath());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateBoard"));
			pstmt.setString(1,b.getBoardTitle());
			pstmt.setString(2,b.getBoardWriter());
			pstmt.setString(3,b.getBoardContent());
			pstmt.setInt(4,b.getBoardPrice());
			pstmt.setInt(5,b.getBoardAmount());
			pstmt.setInt(6,b.getBoardIsNego());
			pstmt.setString(7,b.getBoardFilePath());
			pstmt.setInt(8,b.getBoardNumber());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteBoard"));
			pstmt.setInt(1,b.getBoardIsDelete());
			pstmt.setInt(2,b.getBoardNumber());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
