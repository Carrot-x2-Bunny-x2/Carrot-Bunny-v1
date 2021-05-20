package com.board.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.board.model.dao.BoardDao;
import com.board.model.vo.Board;

public class BoardService {
	
	private BoardDao dao = new BoardDao();
	
	public List<Board> selectBoardList(int cpage, int numPerPage) {
		Connection conn = getConnection();
		List<Board> list = dao.selectBoardList(conn, cpage, numPerPage);
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
}
