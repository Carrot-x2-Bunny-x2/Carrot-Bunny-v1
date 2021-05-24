package com.qna.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.qna.model.vo.Qna;

import static com.common.JDBCTemplate.close;

public class QnaDao {
	
	private Properties prop=new Properties();
	
	public QnaDao() {
		String path=QnaDao.class.getResource("/sql/qna_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Qna> selectQnaList(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Qna> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectQnaList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Qna b=new Qna();
				b.setQnaNo(rs.getInt("board_no"));
				b.setQnaTitle(rs.getString("board_title"));
				b.setQnaWriter(rs.getString("board_writer"));
				b.setQnaContent(rs.getString("board_content"));
				b.setOriginalFileName(rs.getString("board_original_filename"));
				b.setRenamedFileName(rs.getString("board_renamed_filename"));
				b.setQnaDate(rs.getDate("board_date"));
				b.setIsChecked(rs.getInt("board_readcount"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
		
	}
	
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectBoardCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public Qna selectBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Qna b=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectBoard"));
			pstmt.setInt(1, boardNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				b=new Qna();
				b.setQnaNo(rs.getInt("board_no"));
				b.setQnaTitle(rs.getString("board_title"));
				b.setQnaWriter(rs.getString("board_writer"));
				b.setQnaContent(rs.getString("board_content"));
				b.setOriginalFileName(rs.getString("board_original_filename"));
				b.setRenamedFileName(rs.getString("board_renamed_filename"));
				b.setQnaDate(rs.getDate("board_date"));
				b.setIsChecked(rs.getInt("board_readcount"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return b;
	}

	public int insertBoard(Connection conn, Qna b) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertBoard"));
			pstmt.setString(1, b.getQnaTitle());
			pstmt.setString(2, b.getQnaWriter());
			pstmt.setString(3, b.getQnaContent());
			pstmt.setString(4, b.getOriginalFileName());
			pstmt.setString(5, b.getRenamedFileName());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}

	public int deleteQna(Connection conn, int noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Qna selectQnaDetail(Connection conn, int no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
