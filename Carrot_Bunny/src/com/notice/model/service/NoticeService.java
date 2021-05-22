package com.notice.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.notice.model.dao.NoticeDao;
import com.notice.model.vo.Notice;

public class NoticeService {

		private NoticeDao dao = new NoticeDao();
		
		public List<Notice> noticeList(){
			Connection conn = getConnection();
			List<Notice> list = dao.noticeList(conn);
			close(conn);
			return list;
		}
		
		
		public int insertNotice(Notice n) {
			Connection conn = getConnection();
			int result = dao.insertNotice(conn, n);
			
			if(result>0) commit(conn); 
			else rollback(conn);
		
			close(conn);
			return result;
		}
}
