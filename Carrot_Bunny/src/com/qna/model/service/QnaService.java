package com.qna.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.board.model.vo.Board;
import com.qna.model.dao.QnaDao;
import com.qna.model.vo.Qna;

public class QnaService {
	
	private QnaDao dao=new QnaDao();
	
	// admin이 볼 때 전부 뜨기
	public List<Qna> QnaList(){
		Connection conn = getConnection();
		List<Qna> list = dao.qnaList(conn);
		close(conn);
		return list;
	}
	
	//USER이 볼 때 ID 값으로 찾기
	public List<Qna> QnaListUser(String id){
		Connection conn = getConnection();
		List<Qna> list = dao.qnaListUser(conn, id);
		close(conn);
		return list;
	}

	public Qna selectQna(int num) {
		
		Connection conn=getConnection();
		Qna q=dao.selectQna(conn, num);
		close(conn);
		
		return q;
	}
	
	public int insertBoard(Qna b) {
		
		return 0;
	}
	
	public int deleteNotice(int noticeNo) {
		
		return 0;
	}
	
	
}
