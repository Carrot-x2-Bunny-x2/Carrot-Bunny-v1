package com.admin.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.admin.model.dao.AdminDao;
import com.member.model.vo.Member;


public class AdminService {

	private AdminDao dao = new AdminDao();
	
	public List<Member> selectMemberList(int cPage, int numPerPage){
		Connection conn= getConnection();
		List<Member> list = dao.selectMemberList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int selectMemberCount() {
		Connection conn = getConnection();
		int result = dao.selectMemberCount(conn);
		close(conn);
		return result;
	}
	
	public Member selectMemberDetail(int no) {
		Connection conn = getConnection();
		Member m = dao.selectMemberDetail(conn, no);
		close(conn);
		return m;
	}
	
	public int deleteMember(int memberNum) {
		Connection conn=getConnection();
		int result = dao.deleteNotice(conn,memberNum);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
