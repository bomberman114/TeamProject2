package com.green.user.resume.intro.vo;

public class UserResumeIntroVo {
	private   int       user_resume_intro_idx;       // 자소서 번호   
	private   int       user_resume_intro_index;     // 자소서 순서
	private   String    user_resume_intro_title;     // 자소서 제목
	private   String    user_resume_intro_content;   // 자소서 내용
	private   int       user_resume_idx;             // 이력서 번호
	
	public UserResumeIntroVo() {}

	public UserResumeIntroVo(int user_resume_intro_idx, int user_resume_intro_index, String user_resume_intro_title,
			String user_resume_intro_content, int user_resume_idx) {
		super();
		this.user_resume_intro_idx = user_resume_intro_idx;
		this.user_resume_intro_index = user_resume_intro_index;
		this.user_resume_intro_title = user_resume_intro_title;
		this.user_resume_intro_content = user_resume_intro_content;
		this.user_resume_idx = user_resume_idx;
	}

	public int getUser_resume_intro_idx() {
		return user_resume_intro_idx;
	}

	public void setUser_resume_intro_idx(int user_resume_intro_idx) {
		this.user_resume_intro_idx = user_resume_intro_idx;
	}

	public int getUser_resume_intro_index() {
		return user_resume_intro_index;
	}

	public void setUser_resume_intro_index(int user_resume_intro_index) {
		this.user_resume_intro_index = user_resume_intro_index;
	}

	public String getUser_resume_intro_title() {
		return user_resume_intro_title;
	}

	public void setUser_resume_intro_title(String user_resume_intro_title) {
		this.user_resume_intro_title = user_resume_intro_title;
	}

	public String getUser_resume_intro_content() {
		return user_resume_intro_content;
	}

	public void setUser_resume_intro_content(String user_resume_intro_content) {
		this.user_resume_intro_content = user_resume_intro_content;
	}

	public int getUser_resume_idx() {
		return user_resume_idx;
	}

	public void setUser_resume_idx(int user_resume_idx) {
		this.user_resume_idx = user_resume_idx;
	}

	@Override
	public String toString() {
		return "UserResumeIntroVo [user_resume_intro_idx=" + user_resume_intro_idx + ", user_resume_intro_index="
				+ user_resume_intro_index + ", user_resume_intro_title=" + user_resume_intro_title
				+ ", user_resume_intro_content=" + user_resume_intro_content + ", user_resume_idx=" + user_resume_idx
				+ "]";
	}
	

}
