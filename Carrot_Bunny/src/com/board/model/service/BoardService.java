package com.board.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.board.model.dao.BoardDao;
import com.board.model.vo.Board;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.rollback;

public class BoardService {
	
	private BoardDao dao = new BoardDao();
	
	public List<Board> selectBoardList(int cpage, int numPerPage) {
		Connection conn = getConnection();
		List<Board> list = dao.selectBoardList(conn, cpage, numPerPage);
		close(conn);
		return list;
	}
	
	public List<Board> selectAliveBoardList(int cpage, int numPerPage) {
		Connection conn = getConnection();
		List<Board> list = dao.selectAliveBoardList(conn, cpage, numPerPage);
		close(conn);
		return list;
	}
	
	public int selectBoardCount() {
		Connection conn = getConnection();
		int result = dao.selectBoardCount(conn);
		close(conn);
		return result;
	}
	
	public Board selectBoard(int num) {
		Connection conn = getConnection();
		Board b = dao.selectBoard(conn, num);
		close(conn);
		return b;
	}
	
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.insertBoard(conn, b);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
	
	public int updateBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.updateBoard(conn, b);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
	
	public int deleteBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.deleteBoard(conn, b);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	public int updateLikeBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.updateLikeBoard(conn, b);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		return result;
	}
}
