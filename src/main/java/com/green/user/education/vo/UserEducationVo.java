package com.green.user.education.vo;

public class UserEducationVo {
	private  int       user_education_idx;       //번호
	private  int       user_resume_idx;          //이력서 번호
	private  String    user_education_status;    //학력 상태
	private  String    user_school_name;         //학교 이름
	
	public UserEducationVo() {}

	public UserEducationVo(int user_education_idx, int user_resume_idx, String user_education_status,
			String user_school_name) {
		super();
		this.user_education_idx = user_education_idx;
		this.user_resume_idx = user_resume_idx;
		this.user_education_status = user_education_status;
		this.user_school_name = user_school_name;
	}

	public int getUser_education_idx() {
		return user_education_idx;
	}

	public void setUser_education_idx(int user_education_idx) {
		this.user_education_idx = user_education_idx;
	}

	public int getUser_resume_idx() {
		return user_resume_idx;
	}

	public void setUser_resume_idx(int user_resume_idx) {
		this.user_resume_idx = user_resume_idx;
	}

	public String getUser_education_status() {
		return user_education_status;
	}

	public void setUser_education_status(String user_education_status) {
		this.user_education_status = user_education_status;
	}

	public String getUser_school_name() {
		return user_school_name;
	}

	public void setUser_school_name(String user_school_name) {
		this.user_school_name = user_school_name;
	}

	@Override
	public String toString() {
		return "UserEducationVo [user_education_idx=" + user_education_idx + ", user_resume_idx=" + user_resume_idx
				+ ", user_education_status=" + user_education_status + ", user_school_name=" + user_school_name + "]";
	}
	
	

}
