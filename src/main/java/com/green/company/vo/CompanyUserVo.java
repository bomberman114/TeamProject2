package com.green.company.vo;

public class CompanyUserVo {
	private int company_user_idx; // 기업회원 idx
	private String company_user_id; // 기업회원 아이디
	private String company_user_passwd; // 기업회원 비밀번호
	private String company_user_name; // 기업회원 이름
	private String company_phone; // 기업회원 연락처
	private String company_name; // 기업이름
	private String company_bcode; // 사업자 등록 번호
	private String company_boss_name; // 회사 대표자명
	private String company_email; // 회사 이메일
	private String company_user_email; // 기업 회원 이메일
	private String company_regdate; // 기업 회원 가입일
	private String company_establish; // 회사 설립일

	public CompanyUserVo() {
	}

	public CompanyUserVo(int company_user_idx, String company_user_id, String company_user_passwd,
			String company_user_name, String company_phone, String company_name, String company_bcode,
			String company_boss_name, String company_email, String company_user_email, String company_regdate,
			String company_establish) {
		super();
		this.company_user_idx = company_user_idx;
		this.company_user_id = company_user_id;
		this.company_user_passwd = company_user_passwd;
		this.company_user_name = company_user_name;
		this.company_phone = company_phone;
		this.company_name = company_name;
		this.company_bcode = company_bcode;
		this.company_boss_name = company_boss_name;
		this.company_email = company_email;
		this.company_user_email = company_user_email;
		this.company_regdate = company_regdate;
		this.company_establish = company_establish;
	}

	public int getCompany_user_idx() {
		return company_user_idx;
	}

	public void setCompany_user_idx(int company_user_idx) {
		this.company_user_idx = company_user_idx;
	}

	public String getCompany_user_id() {
		return company_user_id;
	}

	public void setCompany_user_id(String company_user_id) {
		this.company_user_id = company_user_id;
	}

	public String getCompany_user_passwd() {
		return company_user_passwd;
	}

	public void setCompany_user_passwd(String company_user_passwd) {
		this.company_user_passwd = company_user_passwd;
	}

	public String getCompany_user_name() {
		return company_user_name;
	}

	public void setCompany_user_name(String company_user_name) {
		this.company_user_name = company_user_name;
	}

	public String getCompany_phone() {
		return company_phone;
	}

	public void setCompany_phone(String company_phone) {
		this.company_phone = company_phone;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_bcode() {
		return company_bcode;
	}

	public void setCompany_bcode(String company_bcode) {
		this.company_bcode = company_bcode;
	}

	public String getCompany_boss_name() {
		return company_boss_name;
	}

	public void setCompany_boss_name(String company_boss_name) {
		this.company_boss_name = company_boss_name;
	}

	public String getCompany_email() {
		return company_email;
	}

	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}

	public String getCompany_user_email() {
		return company_user_email;
	}

	public void setCompany_user_email(String company_user_email) {
		this.company_user_email = company_user_email;
	}

	public String getCompany_regdate() {
		return company_regdate;
	}

	public void setCompany_regdate(String company_regdate) {
		this.company_regdate = company_regdate;
	}

	public String getCompany_establish() {
		return company_establish;
	}

	public void setCompany_establish(String company_establish) {
		this.company_establish = company_establish;
	}

	@Override
	public String toString() {
		return "CompanyUserVo [company_user_idx=" + company_user_idx + ", company_user_id=" + company_user_id
				+ ", company_user_passwd=" + company_user_passwd + ", company_user_name=" + company_user_name
				+ ", company_phone=" + company_phone + ", company_name=" + company_name + ", company_bcode="
				+ company_bcode + ", company_boss_name=" + company_boss_name + ", company_email=" + company_email
				+ ", company_user_email=" + company_user_email + ", company_regdate=" + company_regdate
				+ ", company_establish=" + company_establish + "]";
	}

}
