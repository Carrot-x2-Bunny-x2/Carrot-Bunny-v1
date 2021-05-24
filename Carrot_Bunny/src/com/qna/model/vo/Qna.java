package com.qna.model.vo;

import java.util.Date;

public class Qna {

	private int QnaNo;
	private String QnaTitle;
	private String QnaWriter;
	private String QnaContent;
	private String originalFileName;
	private String renamedFileName;
	private Date QnaDate;
	private int isChecked;
	
	public Qna() {
		
	}

	public Qna(int qnaNo, String qnaTitle, String qnaWriter, String qnaContent, String originalFileName,
			String renamedFileName, Date qnaDate, int isChecked) {
		super();
		this.QnaNo = qnaNo;
		this.QnaTitle = qnaTitle;
		this.QnaWriter = qnaWriter;
		this.QnaContent = qnaContent;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.QnaDate = qnaDate;
		this.isChecked = isChecked;
	}

	public int getQnaNo() {
		return QnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.QnaNo = qnaNo;
	}

	public String getQnaTitle() {
		return QnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.QnaTitle = qnaTitle;
	}

	public String getQnaWriter() {
		return QnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.QnaWriter = qnaWriter;
	}

	public String getQnaContent() {
		return QnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.QnaContent = qnaContent;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	public Date getQnaDate() {
		return QnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.QnaDate = qnaDate;
	}

	public int getIsChecked() {
		return isChecked;
	}

	public void setIsChecked(int isChecked) {
		this.isChecked = isChecked;
	}

}
