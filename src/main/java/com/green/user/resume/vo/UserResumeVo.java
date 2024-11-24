package com.green.user.resume.vo;

public class UserResumeVo {
	private int       user_resume_idx;         //이력서 번호
	private String    user_title;              //개인 회원 이력서 제목
	private int       user_idx;                //개인 회원 번호
	private int 	  common_duty_idx;         //직무
	private String    user_gender;             //성별
	private String    user_name;               //개인 회원 이름
	private String    user_birth;              //개인 회원 생일
	private String    user_phone;              //개인 회원 번호
	private String    user_email;              //개인 회원 메일
	private int       region_idx;              //지역 번호
	private String    region_address;          //주소
	private String    user_resume_regdate;     //이력서 등록일
	private int       user_resume_views;       //이력서 조회수
	private String    user_resume_career_type; //신입 경력 구분
	
	public UserResumeVo() {	
	}

	public UserResumeVo(int user_resume_idx, String user_title, int user_idx, int common_duty_idx, String user_gender,
			String user_name, String user_birth, String user_phone, String user_email, int region_idx,
			String region_address, String user_resume_regdate, int user_resume_views, String user_resume_career_type) {
		this.user_resume_idx     	  = user_resume_idx;
		this.user_title          	  = user_title;
		this.user_idx            	  = user_idx;
		this.common_duty_idx     	  = common_duty_idx;
		this.user_gender         	  = user_gender;
		this.user_name           	  = user_name;
		this.user_birth          	  = user_birth;
		this.user_phone          	  = user_phone;
		this.user_email          	  = user_email;
		this.region_idx          	  = region_idx;
		this.region_address           = region_address;
		this.user_resume_regdate      = user_resume_regdate;
		this.user_resume_views        = user_resume_views;
		this.user_resume_career_type  = user_resume_career_type;
	}

	public int getUser_resume_idx() {
		return user_resume_idx;
	}

	public void setUser_resume_idx(int user_resume_idx) {
		this.user_resume_idx = user_resume_idx;
	}

	public String getUser_title() {
		return user_title;
	}

	public void setUser_title(String user_title) {
		this.user_title = user_title;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getCommon_duty_idx() {
		return common_duty_idx;
	}

	public void setCommon_duty_idx(int common_duty_idx) {
		this.common_duty_idx = common_duty_idx;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
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

	public int getRegion_idx() {
		return region_idx;
	}

	public void setRegion_idx(int region_idx) {
		this.region_idx = region_idx;
	}

	public String getRegion_address() {
		return region_address;
	}

	public void setRegion_address(String region_address) {
		this.region_address = region_address;
	}

	public String getUser_resume_regdate() {
		return user_resume_regdate;
	}

	public void setUser_resume_regdate(String user_resume_regdate) {
		this.user_resume_regdate = user_resume_regdate;
	}

	public int getUser_resume_views() {
		return user_resume_views;
	}

	public void setUser_resume_views(int user_resume_views) {
		this.user_resume_views = user_resume_views;
	}

	public String getUser_resume_career_type() {
		return user_resume_career_type;
	}

	public void setUser_resume_career_type(String user_resume_career_type) {
		this.user_resume_career_type = user_resume_career_type;
	}

	@Override
	public String toString() {
		return "UserResumeVo [user_resume_idx=" + user_resume_idx + ", user_title=" + user_title + ", user_idx="
				+ user_idx + ", common_duty_idx=" + common_duty_idx + ", user_gender=" + user_gender + ", user_name="
				+ user_name + ", user_birth=" + user_birth + ", user_phone=" + user_phone + ", user_email=" + user_email
				+ ", region_idx=" + region_idx + ", region_address=" + region_address + ", user_resume_regdate="
				+ user_resume_regdate + ", user_resume_views=" + user_resume_views + ", user_resume_career_type="
				+ user_resume_career_type + "]";
	}

}
