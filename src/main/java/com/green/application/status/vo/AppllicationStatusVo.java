package com.green.application.status.vo;

public class AppllicationStatusVo {

	private int application_status_idx;
	private int application_status_type; // 지원상태타입 (심사중,합격,불합격)

	public AppllicationStatusVo() {
	}

	public AppllicationStatusVo(int application_status_idx, int application_status_type) {
		super();
		this.application_status_idx = application_status_idx;
		this.application_status_type = application_status_type;
	}

	public int getApplication_status_idx() {
		return application_status_idx;
	}

	public void setApplication_status_idx(int application_status_idx) {
		this.application_status_idx = application_status_idx;
	}

	public int getApplication_status_type() {
		return application_status_type;
	}

	public void setApplication_status_type(int application_status_type) {
		this.application_status_type = application_status_type;
	}

	@Override
	public String toString() {
		return "AppllicationStatusVo [application_status_idx=" + application_status_idx + ", application_status_type="
				+ application_status_type + "]";
	}

}
