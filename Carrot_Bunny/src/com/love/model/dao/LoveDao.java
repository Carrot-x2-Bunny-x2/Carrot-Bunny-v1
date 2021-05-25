package com.love.model.dao;

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

import com.board.model.vo.Board;
import com.love.model.vo.Love;
import com.member.model.vo.Member;

public class LoveDao {
	private Properties prop = new Properties();

	public LoveDao() {
		String filepath = LoveDao.class.getResource("/sql/love_sql.properties").getPath();
		try {
			prop.load(new FileReader(filepath));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Love> selectLoveList(Connection conn, int cPage, int numPerPage, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Love> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectLoveList"));
			pstmt.setString(1, m.getUserId());
			pstmt.setInt(2, (cPage-1)*numPerPage + 1);
			pstmt.setInt(3,  cPage*numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Love lo = new Love();
				lo.setBoardNumber(rs.getInt("b_num"));
				lo.setUserId(rs.getString("m_id"));
				list.add(lo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
}
