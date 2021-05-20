package com.board.model.dao;

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

public class BoardDao {

	private Properties prop = new Properties();
	
	public BoardDao() {
		String filepath = BoardDao.class.getResource("/sql/board_sql.properties").getPath();
		try {
			prop.load(new FileReader(filepath));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBoardList"));
			pstmt.setInt(1, (cPage-1)*numPerPage + 1);
			pstmt.setInt(2,  cPage*numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board b = new Board();
				b.setBoardNumber(rs.getInt("b_number"));
				b.setBoardTitle(rs.getString("b_title"));
				b.setBoardWriter(rs.getString("b_writer"));
				b.setBoardContent(rs.getString("b_content"));
				b.setBoardPrice(rs.getInt("b_price"));
				b.setBoardAmount(rs.getInt("b_amount"));
				b.setBoardIsSell(rs.getInt("b_isSell"));
				b.setBoardLike(rs.getString("b_like"));
				b.setBoardIsNego(rs.getInt("b_isNego"));
				b.setBoardIsDelete(rs.getInt("b_isDelete"));
				b.setBoardFilePath(rs.getString("b_filePath"));
				b.setBoardReFilePath(rs.getString("b_reFilePath"));
				b.setBoardDate(rs.getDate("b_date"));
				b.setBoardReadCount(rs.getInt("b_readCount"));
				list.add(b);
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
