package com.member.model.vo;

import java.util.Date;

public class Member {
	private String userId;
	private String password;
	private String userName;
	private String email;
	private String phone;
	private int isAgree;
	private int isDelete;
	private int isAdmin;
	
	public Member() {
		
	}

	public Member(String userId, String password, String userName, String email, String phone, int isAgree,
			int isDelete, int isAdmin) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.isAgree = isAgree;
		this.isDelete = isDelete;
		this.isAdmin = isAdmin;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getIsAgree() {
		return isAgree;
	}

	public void setIsAgree(int isAgree) {
		this.isAgree = isAgree;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", userName=" + userName + ", email=" + email
				+ ", phone=" + phone + ", isAgree=" + isAgree + ", isDelete=" + isDelete + ", isAdmin=" + isAdmin + "]";
	}

	
}
