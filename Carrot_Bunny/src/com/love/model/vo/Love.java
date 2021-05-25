package com.love.model.vo;

public class Love {
	
	private int boardNumber;
	private String userId;
	
	public Love() {
		
	}

	public Love(int boardNumber, String userId) {
		super();
		this.boardNumber = boardNumber;
		this.userId = userId;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
