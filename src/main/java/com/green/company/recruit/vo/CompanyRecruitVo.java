package com.green.company.recruit.vo;

public class CompanyRecruitVo {

	private int company_recruit_idx; // 채용 공고 번호
	private int company_user_idx; // 기업 회원 번호
	private String company_name; // 기업 이름
	private String recruit_title; // 채용 공고 제목
	private String company_job; // 모집 부문
	private int common_duty_idx; // 직무
	private int education_status_idx; // 학력
	private String main_work_content1; // 주요 업무1
	private String main_work_content2; // 주요 업무2
	private String main_work_content3; // 주요 업무3
	private String qualification1; // 자격 요건1
	private String qualification2; // 자격 요건2
	private String qualification3; // 자격 요건3
	private String preferential_treatment1; // 우대 사항1
	private String preferential_treatment2; // 우대 사항2
	private String preferential_treatment3; // 우대 사항3
	private int getman; // 모집 인원 수
	private int region_idx; // 근무 지역
	private String company_address; // 근무 위치
	private String company_info; // 기업 정보
	private String application_deadline; // 마감 기한
	private String company_establish; // 회사 설립일
	private String company_recruit_regdate; // 채용 공고 등록일
	private int company_recruit_views; // 채용 공고 조회수

	public CompanyRecruitVo() {
	}

	public CompanyRecruitVo(int company_recruit_idx, int company_user_idx, String company_name, String recruit_title,
			String company_job, int common_duty_idx, int education_status_idx, String main_work_content1,
			String main_work_content2, String main_work_content3, String qualification1, String qualification2,
			String qualification3, String preferential_treatment1, String preferential_treatment2,
			String preferential_treatment3, int getman, int region_idx, String company_address, String company_info,
			String application_deadline, String company_establish, String company_recruit_regdate,
			int company_recruit_views) {
		super();
		this.company_recruit_idx = company_recruit_idx;
		this.company_user_idx = company_user_idx;
		this.company_name = company_name;
		this.recruit_title = recruit_title;
		this.company_job = company_job;
		this.common_duty_idx = common_duty_idx;
		this.education_status_idx = education_status_idx;
		this.main_work_content1 = main_work_content1;
		this.main_work_content2 = main_work_content2;
		this.main_work_content3 = main_work_content3;
		this.qualification1 = qualification1;
		this.qualification2 = qualification2;
		this.qualification3 = qualification3;
		this.preferential_treatment1 = preferential_treatment1;
		this.preferential_treatment2 = preferential_treatment2;
		this.preferential_treatment3 = preferential_treatment3;
		this.getman = getman;
		this.region_idx = region_idx;
		this.company_address = company_address;
		this.company_info = company_info;
		this.application_deadline = application_deadline;
		this.company_establish = company_establish;
		this.company_recruit_regdate = company_recruit_regdate;
		this.company_recruit_views = company_recruit_views;
	}

	public int getCompany_recruit_idx() {
		return company_recruit_idx;
	}

	public void setCompany_recruit_idx(int company_recruit_idx) {
		this.company_recruit_idx = company_recruit_idx;
	}

	public int getCompany_user_idx() {
		return company_user_idx;
	}

	public void setCompany_user_idx(int company_user_idx) {
		this.company_user_idx = company_user_idx;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getRecruit_title() {
		return recruit_title;
	}

	public void setRecruit_title(String recruit_title) {
		this.recruit_title = recruit_title;
	}

	public String getCompany_job() {
		return company_job;
	}

	public void setCompany_job(String company_job) {
		this.company_job = company_job;
	}

	public int getCommon_duty_idx() {
		return common_duty_idx;
	}

	public void setCommon_duty_idx(int common_duty_idx) {
		this.common_duty_idx = common_duty_idx;
	}

	public int getEducation_status_idx() {
		return education_status_idx;
	}

	public void setEducation_status_idx(int education_status_idx) {
		this.education_status_idx = education_status_idx;
	}

	public String getMain_work_content1() {
		return main_work_content1;
	}

	public void setMain_work_content1(String main_work_content1) {
		this.main_work_content1 = main_work_content1;
	}

	public String getMain_work_content2() {
		return main_work_content2;
	}

	public void setMain_work_content2(String main_work_content2) {
		this.main_work_content2 = main_work_content2;
	}

	public String getMain_work_content3() {
		return main_work_content3;
	}

	public void setMain_work_content3(String main_work_content3) {
		this.main_work_content3 = main_work_content3;
	}

	public String getQualification1() {
		return qualification1;
	}

	public void setQualification1(String qualification1) {
		this.qualification1 = qualification1;
	}

	public String getQualification2() {
		return qualification2;
	}

	public void setQualification2(String qualification2) {
		this.qualification2 = qualification2;
	}

	public String getQualification3() {
		return qualification3;
	}

	public void setQualification3(String qualification3) {
		this.qualification3 = qualification3;
	}

	public String getPreferential_treatment1() {
		return preferential_treatment1;
	}

	public void setPreferential_treatment1(String preferential_treatment1) {
		this.preferential_treatment1 = preferential_treatment1;
	}

	public String getPreferential_treatment2() {
		return preferential_treatment2;
	}

	public void setPreferential_treatment2(String preferential_treatment2) {
		this.preferential_treatment2 = preferential_treatment2;
	}

	public String getPreferential_treatment3() {
		return preferential_treatment3;
	}

	public void setPreferential_treatment3(String preferential_treatment3) {
		this.preferential_treatment3 = preferential_treatment3;
	}

	public int getGetman() {
		return getman;
	}

	public void setGetman(int getman) {
		this.getman = getman;
	}

	public int getRegion_idx() {
		return region_idx;
	}

	public void setRegion_idx(int region_idx) {
		this.region_idx = region_idx;
	}

	public String getCompany_address() {
		return company_address;
	}

	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}

	public String getCompany_info() {
		return company_info;
	}

	public void setCompany_info(String company_info) {
		this.company_info = company_info;
	}

	public String getApplication_deadline() {
		return application_deadline;
	}

	public void setApplication_deadline(String application_deadline) {
		this.application_deadline = application_deadline;
	}

	public String getCompany_establish() {
		return company_establish;
	}

	public void setCompany_establish(String company_establish) {
		this.company_establish = company_establish;
	}

	public String getCompany_recruit_regdate() {
		return company_recruit_regdate;
	}

	public void setCompany_recruit_regdate(String company_recruit_regdate) {
		this.company_recruit_regdate = company_recruit_regdate;
	}

	public int getCompany_recruit_views() {
		return company_recruit_views;
	}

	public void setCompany_recruit_views(int company_recruit_views) {
		this.company_recruit_views = company_recruit_views;
	}

	@Override
	public String toString() {
		return "CompanyRecruitVo [company_recruit_idx=" + company_recruit_idx + ", company_user_idx=" + company_user_idx
				+ ", company_name=" + company_name + ", recruit_title=" + recruit_title + ", company_job=" + company_job
				+ ", common_duty_idx=" + common_duty_idx + ", education_status_idx=" + education_status_idx
				+ ", main_work_content1=" + main_work_content1 + ", main_work_content2=" + main_work_content2
				+ ", main_work_content3=" + main_work_content3 + ", qualification1=" + qualification1
				+ ", qualification2=" + qualification2 + ", qualification3=" + qualification3
				+ ", preferential_treatment1=" + preferential_treatment1 + ", preferential_treatment2="
				+ preferential_treatment2 + ", preferential_treatment3=" + preferential_treatment3 + ", getman="
				+ getman + ", region_idx=" + region_idx + ", company_address=" + company_address + ", company_info="
				+ company_info + ", application_deadline=" + application_deadline + ", company_establish="
				+ company_establish + ", company_recruit_regdate=" + company_recruit_regdate
				+ ", company_recruit_views=" + company_recruit_views + "]";
	}

}
