package com.green.user.career.vo;

public class UserCareerVo {
	private int user_career_idx; // 기본키
	private int user_resume_idx; // 이력서 외래키
	private String user_career_status; // 일 상태
	private String user_wooked_company_name; // 다녔던 회사이름
	private String user_career_contente; // 헀던일
	private String user_wooked_year_start; // 일 시작 날짜
	private String user_wooked_year_end; // 일 끝난날짜

	public UserCareerVo() {
	}

	public UserCareerVo(int user_career_idx, int user_resume_idx, String user_career_status,
			String user_wooked_company_name, String user_career_contente, String user_wooked_year_start,
			String user_wooked_year_end) {
		super();
		this.user_career_idx = user_career_idx;
		this.user_resume_idx = user_resume_idx;
		this.user_career_status = user_career_status;
		this.user_wooked_company_name = user_wooked_company_name;
		this.user_career_contente = user_career_contente;
		this.user_wooked_year_start = user_wooked_year_start;
		this.user_wooked_year_end = user_wooked_year_end;
	}

	public int getUser_career_idx() {
		return user_career_idx;
	}

	public void setUser_career_idx(int user_career_idx) {
		this.user_career_idx = user_career_idx;
	}

	public int getUser_resume_idx() {
		return user_resume_idx;
	}

	public void setUser_resume_idx(int user_resume_idx) {
		this.user_resume_idx = user_resume_idx;
	}

	public String getUser_career_status() {
		return user_career_status;
	}

	public void setUser_career_status(String user_career_status) {
		this.user_career_status = user_career_status;
	}

	public String getUser_wooked_company_name() {
		return user_wooked_company_name;
	}

	public void setUser_wooked_company_name(String user_wooked_company_name) {
		this.user_wooked_company_name = user_wooked_company_name;
	}

	public String getUser_career_contente() {
		return user_career_contente;
	}

	public void setUser_career_contente(String user_career_contente) {
		this.user_career_contente = user_career_contente;
	}

	public String getUser_wooked_year_start() {
		return user_wooked_year_start;
	}

	public void setUser_wooked_year_start(String user_wooked_year_start) {
		this.user_wooked_year_start = user_wooked_year_start;
	}

	public String getUser_wooked_year_end() {
		return user_wooked_year_end;
	}

	public void setUser_wooked_year_end(String user_wooked_year_end) {
		this.user_wooked_year_end = user_wooked_year_end;
	}

	@Override
	public String toString() {
		return "UserCareerVo [user_career_idx=" + user_career_idx + ", user_resume_idx=" + user_resume_idx
				+ ", user_career_status=" + user_career_status + ", user_wooked_company_name="
				+ user_wooked_company_name + ", user_career_contente=" + user_career_contente
				+ ", user_wooked_year_start=" + user_wooked_year_start + ", user_wooked_year_end="
				+ user_wooked_year_end + "]";
	}

}
