package com.love.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.board.model.dao.BoardDao;

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
}
