package com.love.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.love.model.dao.LoveDao;
import com.love.model.vo.Love;
import com.member.model.vo.Member;

public class LoveService {
	private LoveDao dao = new LoveDao();
	
	public List<Love> selectLoveList(int cpage, int numPerPage, Member m) {
		Connection conn = getConnection();
		List<Love> list = dao.selectLoveList(conn, cpage, numPerPage, m);
		close(conn);
		return list;
		
	}
}
