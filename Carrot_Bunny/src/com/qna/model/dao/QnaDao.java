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

import com.board.model.vo.Board;
import com.notice.model.vo.Notice;
import com.qna.model.vo.Qna;

import static com.common.JDBCTemplate.close;

public class QnaDao {
	
	private Properties prop=new Properties();
	
	//db와 연결
	public QnaDao() {
		String path=QnaDao.class.getResource("/sql/qna_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//QNA데이터들 불러오기  ADMIN
	public List<Qna> qnaList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectQna"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Qna q = new Qna();
				q.setQnaNo(rs.getInt("n_num"));
				q.setQnaTitle(rs.getString("n_title"));
				q.setQnaWriter(rs.getString("n_content"));
				q.setQnaContent(rs.getString("n_content"));
				q.setQnaDate(rs.getDate("n_date"));
				list.add(q);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	//QNA데이터들 불러오기   USER
		public List<Qna> qnaListUser(Connection conn, String id){
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Qna> list = new ArrayList();
			try {
				pstmt = conn.prepareStatement(prop.getProperty("selectQna"));
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Qna q = new Qna();
					q.setQnaNo(rs.getInt("n_num"));
					q.setQnaTitle(rs.getString("n_title"));
					q.setQnaWriter(rs.getString("n_content"));
					q.setQnaContent(rs.getString("n_content"));
					q.setQnaDate(rs.getDate("n_date"));
					list.add(q);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return list;
		}
	
	
	//선택한 1:1문의 글 내용 불러오기
	public Qna selectQna(Connection conn, int no) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Qna q=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectBoard"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				q = new Qna();
				q.setQnaNo(rs.getInt("n_num"));
				q.setQnaTitle(rs.getString("n_title"));
				q.setQnaWriter(rs.getString("n_content"));
				q.setQnaContent(rs.getString("n_content"));
				q.setQnaDate(rs.getDate("n_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return q;
	}

	// 새로운 QNA 등록하기 (USER)
	public int insertBoard(Connection conn, Qna b) {
		
		return 0;		
	}
	
	// 선택한 QNA에 ANSWER 등록하기 (ADMIN)
	public int inserAnswer(Connection conn, Qna b) {

		return 0;		
	}
	
	// QNA 삭제하기 ONLY ADMIN
	public int deleteQna(Connection conn, int noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
}
