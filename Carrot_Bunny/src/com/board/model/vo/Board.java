package com.board.model.vo;

import java.util.Date;

public class Board {
	
	private int boardNumber;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private int boardPrice;
	private int boardAmount;
	private int boardIsSell;
	private String boardLike;
	private int boardIsNego;
	private int boardIsDelete;
	private String boardFilePath;
	private String boardReFilePath;
	private Date boardDate;
	private int boardReadCount;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(int boardNumber, String boardTitle, String boardWriter, String boardContent, int boardPrice,
			int boardAmount, int boardIsSell, String boardLike, int boardIsNego, int boardIsDelete,
			String boardFilePath, String boardReFilePath, Date boardDate, int boardReadCount) {
		super();
		this.boardNumber = boardNumber;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.boardPrice = boardPrice;
		this.boardAmount = boardAmount;
		this.boardIsSell = boardIsSell;
		this.boardLike = boardLike;
		this.boardIsNego = boardIsNego;
		this.boardIsDelete = boardIsDelete;
		this.boardFilePath = boardFilePath;
		this.boardReFilePath = boardReFilePath;
		this.boardDate = boardDate;
		this.boardReadCount = boardReadCount;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardPrice() {
		return boardPrice;
	}

	public void setBoardPrice(int boardPrice) {
		this.boardPrice = boardPrice;
	}

	public int getBoardAmount() {
		return boardAmount;
	}

	public void setBoardAmount(int boardAmount) {
		this.boardAmount = boardAmount;
	}

	public int getBoardIsSell() {
		return boardIsSell;
	}

	public void setBoardIsSell(int boardIsSell) {
		this.boardIsSell = boardIsSell;
	}

	public String getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(String boardLike) {
		this.boardLike = boardLike;
	}

	public int getBoardIsNego() {
		return boardIsNego;
	}

	public void setBoardIsNego(int boardIsNego) {
		this.boardIsNego = boardIsNego;
	}

	public int getBoardIsDelete() {
		return boardIsDelete;
	}

	public void setBoardIsDelete(int boardIsDelete) {
		this.boardIsDelete = boardIsDelete;
	}

	public String getBoardFilePath() {
		return boardFilePath;
	}

	public void setBoardFilePath(String boardFilePath) {
		this.boardFilePath = boardFilePath;
	}

	public String getBoardReFilePath() {
		return boardReFilePath;
	}

	public void setBoardReFilePath(String boardReFilePath) {
		this.boardReFilePath = boardReFilePath;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardReadCount() {
		return boardReadCount;
	}

	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}
	
	
}
