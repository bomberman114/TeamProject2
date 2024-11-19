package com.green.education.status.vo;

public class EducationStatusVo {

	private int education_status_idx; // 학력상태 기본키
	private String education_status_type; // 학력상태타입

	public EducationStatusVo() {
	}

	public EducationStatusVo(int education_status_idx, String education_status_type) {
		super();
		this.education_status_idx = education_status_idx;
		this.education_status_type = education_status_type;
	}

	public int getEducation_status_idx() {
		return education_status_idx;
	}

	public void setEducation_status_idx(int education_status_idx) {
		this.education_status_idx = education_status_idx;
	}

	public String getEducation_status_type() {
		return education_status_type;
	}

	public void setEducation_status_type(String education_status_type) {
		this.education_status_type = education_status_type;
	}

	@Override
	public String toString() {
		return "EducationStatusVo [education_status_idx=" + education_status_idx + ", education_status_type="
				+ education_status_type + "]";
	}

}
