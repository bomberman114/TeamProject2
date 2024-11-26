package com.green.application.vo;

public class AppllicationVo {
	
	private int    application_idx; // 지원내역키
	private int    user_resume_idx; // 이력서 번호
	private int    company_recruit_idx; // 채용 공고 번호
	private int    application_status_idx; // 지원상태
	private String applied_date; // 지원날짜
	
	public AppllicationVo() {}
	
	public AppllicationVo(int application_idx, int user_resume_idx, int company_recruit_idx, int application_status_idx,
			String applied_date) {
		this.application_idx = application_idx;
		this.user_resume_idx = user_resume_idx;
		this.company_recruit_idx = company_recruit_idx;
		this.application_status_idx = application_status_idx;
		this.applied_date = applied_date;
	}
	
	public int getApplication_idx() {
		return application_idx;
	}
	public void setApplication_idx(int application_idx) {
		this.application_idx = application_idx;
	}
	public int getUser_resume_idx() {
		return user_resume_idx;
	}
	public void setUser_resume_idx(int user_resume_idx) {
		this.user_resume_idx = user_resume_idx;
	}
	public int getCompany_recruit_idx() {
		return company_recruit_idx;
	}
	public void setCompany_recruit_idx(int company_recruit_idx) {
		this.company_recruit_idx = company_recruit_idx;
	}
	public int getApplication_status_idx() {
		return application_status_idx;
	}
	public void setApplication_status_idx(int application_status_idx) {
		this.application_status_idx = application_status_idx;
	}
	public String getApplied_date() {
		return applied_date;
	}
	public void setApplied_date(String applied_date) {
		this.applied_date = applied_date;
	}

	@Override
	public String toString() {
		return "AppllicationVo [application_idx=" + application_idx + ", user_resume_idx=" + user_resume_idx
				+ ", company_recruit_idx=" + company_recruit_idx + ", application_status_idx=" + application_status_idx
				+ ", applied_date=" + applied_date + "]";
	}
	
	
	 
}
