package com.qna.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.notice.model.vo.Notice;
import com.qna.model.dao.QnaDao;
import com.qna.model.vo.Qna;

public class QnaService {
	
	private QnaDao dao=new QnaDao();
	
	public List<Qna> selectBoardList(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Qna> list=dao.selectQnaList(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public Qna selectQnaDetail(int no) {
		Connection conn=getConnection();
		Qna n=dao.selectQnaDetail(conn, no);
		close(conn);
		return n;
	}
	
	
	
	
	public int selectBoardCount() {
		Connection conn=getConnection();
		int result=dao.selectBoardCount(conn);
		close(conn);
		return result;
	}
	
	public int insertBoard(Qna b) {
		Connection conn=getConnection();
		int result=dao.insertBoard(conn, b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn=getConnection();
		int result = dao.deleteQna(conn,noticeNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
}
