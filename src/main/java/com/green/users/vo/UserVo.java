package com.green.users.vo;

public class UserVo {
	private int    user_idx;           // 개인 회원 아이디
	private String user_id;           // 개인 회원 아이디
	private String user_passwd;       // 개인 회원 비밀번호
	private String user_name;         // 개인 회원 이름
	private String user_birth;         // 개인 회원 이름
	private String user_gender;       // 개인 회원 성별
	private String user_phone;        // 개인 회원 전화번호
	private String user_email;        // 개인 회원 이메일
	private String user_regdate;      // 개인 회원 가입일

	public UserVo() {}

	public UserVo(int user_idx, String user_id, String user_passwd, String user_name, String user_birth,
			String user_gender, String user_phone, String user_email, String user_regdate) {
		this.user_idx     = user_idx;
		this.user_id      = user_id;
		this.user_passwd  = user_passwd;
		this.user_name    = user_name;
		this.user_birth   = user_birth;
		this.user_gender  = user_gender;
		this.user_phone   = user_phone;
		this.user_email   = user_email;
		this.user_regdate = user_regdate;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_passwd() {
		return user_passwd;
	}

	public void setUser_passwd(String user_passwd) {
		this.user_passwd = user_passwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(String user_regdate) {
		this.user_regdate = user_regdate;
	}

	@Override
	public String toString() {
		return "UserVo [user_idx=" + user_idx + ", user_id=" + user_id + ", user_passwd=" + user_passwd + ", user_name=" + user_name
				+ ", user_gender=" + user_gender + ", user_phone=" + user_phone + ", user_email=" + user_email
				+ ", user_regdate=" + user_regdate + "]";
	}

}
