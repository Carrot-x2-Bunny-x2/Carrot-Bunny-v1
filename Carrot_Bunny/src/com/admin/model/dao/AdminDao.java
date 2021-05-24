package com.admin.model.dao;

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

import com.member.model.vo.Member;
import com.notice.model.vo.Notice;

public class AdminDao {

	private Properties props = new Properties();
	public AdminDao() {
		String path = AdminDao.class.getResource("/sql/admin_sql.properties").getPath();
		try {
			props.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<Member> selectMemberList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList();
		try {
			pstmt= conn.prepareStatement(props.getProperty("selectMemberAll"));
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setmemberNum(rs.getInt("member_num"));
				m.setUserId(rs.getString("member_id"));
				m.setPassword(rs.getString("member_pwd"));
				m.setUserName(rs.getString("mem_name"));
				m.setEmail(rs.getString("mem_email"));
				m.setPhone(rs.getString("mem_phone"));
				m.setIsAgree(rs.getInt("mem_agree"));
				m.setIsDelete(rs.getInt("mem_delete"));
				m.setIsAdmin(rs.getInt("mem_admin"));
				m.setenrollDate(rs.getDate("enroll_date")); 
				list.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	public int selectMemberCount (Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(props.getProperty("selectMemberCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	public Member selectMemberDetail(Connection conn, int no) {

		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(props.getProperty("selectAdminDetail"));
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setmemberNum(rs.getInt("member_num"));
				m.setUserName(rs.getString("member_name"));
				m.setPhone(rs.getString("mem_phone"));
				m.setenrollDate(rs.getDate("enroll_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}

}

