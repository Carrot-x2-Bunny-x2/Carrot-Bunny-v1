package com.board.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.board.model.dao.BoardDao;
import com.board.model.vo.Board;
import com.member.model.vo.Member;

public class BoardService {
	
	private BoardDao dao = new BoardDao();
	
	// 삭제가 된 상품까지 모두 select 한다.
	public List<Board> selectBoardList(int cpage, int numPerPage) {
		Connection conn = getConnection();
		List<Board> list = dao.selectBoardList(conn, cpage, numPerPage);
		close(conn);
		return list;
	}
	// 삭제되지 않은 상품만 select한다.
	public List<Board> selectAliveBoardList(int cpage, int numPerPage) {
		Connection conn = getConnection();
		List<Board> list = dao.selectAliveBoardList(conn, cpage, numPerPage);
		close(conn);
		return list;
	}
	// user의 상품만 select 한다.(삭제되지 않은)
	public List<Board> selectUserBoardList(int cpage, int numPerPage,Member m) {
		Connection conn = getConnection();
		List<Board> list = dao.selectUserBoardList(conn, cpage, numPerPage, m);
		close(conn);
		return list;
	}
	// 삭제된 상품까지 모두 count한다.
	public int selectBoardCount() {
		Connection conn = getConnection();
		int result = dao.selectBoardCount(conn);
		close(conn);
		return result;
	}
	// 삭제되지 않은 상품만 count한다.
	public int selectAliveBoardCount() {
		Connection conn = getConnection();
		int result = dao.selectAliveBoardCount(conn);
		close(conn);
		return result;
	}
	// 삭제되지 않은 상품만 count한다.
	public int selectUserBoardCount(Member m) {
		Connection conn = getConnection();
		int result = dao.selectUserBoardCount(conn, m);
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
	// 상품 판매완료 처리
	public int sellBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.sellBoard(conn, b);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		return result;
	}
}
