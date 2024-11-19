package com.green.company.image.vo;

public class CompanyImageVo {

	private int company_image_idx; // 파일고유번호
	private int company_user_idx; // 게시글 번호
	private String company_image_name; // 파일이름
	private String company_image_ext; // 파일확장자
	private String company_sfile_name; // 저장된 실제 파일명

	public CompanyImageVo() {
	}

	public CompanyImageVo(int company_image_idx, int company_user_idx, String company_image_name,
			String company_image_ext, String company_sfile_name) {
		super();
		this.company_image_idx = company_image_idx;
		this.company_user_idx = company_user_idx;
		this.company_image_name = company_image_name;
		this.company_image_ext = company_image_ext;
		this.company_sfile_name = company_sfile_name;
	}

	public int getCompany_image_idx() {
		return company_image_idx;
	}

	public void setCompany_image_idx(int company_image_idx) {
		this.company_image_idx = company_image_idx;
	}

	public int getCompany_user_idx() {
		return company_user_idx;
	}

	public void setCompany_user_idx(int company_user_idx) {
		this.company_user_idx = company_user_idx;
	}

	public String getCompany_image_name() {
		return company_image_name;
	}

	public void setCompany_image_name(String company_image_name) {
		this.company_image_name = company_image_name;
	}

	public String getCompany_image_ext() {
		return company_image_ext;
	}

	public void setCompany_image_ext(String company_image_ext) {
		this.company_image_ext = company_image_ext;
	}

	public String getCompany_sfile_name() {
		return company_sfile_name;
	}

	public void setCompany_sfile_name(String company_sfile_name) {
		this.company_sfile_name = company_sfile_name;
	}

	@Override
	public String toString() {
		return "CompanyImageVo [company_image_idx=" + company_image_idx + ", company_user_idx=" + company_user_idx
				+ ", company_image_name=" + company_image_name + ", company_image_ext=" + company_image_ext
				+ ", company_sfile_name=" + company_sfile_name + "]";
	}

}
