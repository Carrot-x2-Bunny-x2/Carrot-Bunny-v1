package com.notice.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.notice.model.dao.NoticeDao;
import com.notice.model.vo.Notice;

public class NoticeService {

		private NoticeDao dao = new NoticeDao();
		
//		리스트 
		public List<Notice> noticeList(){
			Connection conn = getConnection();
			List<Notice> list = dao.noticeList(conn);
			close(conn);
			return list;
		}
}
