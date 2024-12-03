package com.green.joboffer.rooms.vo;

public class JobofferRoomVo {
	private int joboffer_room_idx; // 포지션 제안 룸 번호
	private String joboffer_room_regdate; // 포지션 제안 룸 생성 일자
	private int user_idx; // 개인 회원 번호
	private int company_user_idx; // 기업 회원 번호
	private String joboffer_room_user_status; // 포지션 제안 유저 상태 (ACTIVE, DEACTIVATE)
	private String joboffer_room_company_user_status; // 포지션 제안 회사유저 상태 (ACTIVE, DEACTIVATE)

	public JobofferRoomVo() {
	}

	public JobofferRoomVo(int joboffer_room_idx, String joboffer_room_regdate, int user_idx, int company_user_idx,
			String joboffer_room_user_status, String joboffer_room_company_user_status) {
		super();
		this.joboffer_room_idx = joboffer_room_idx;
		this.joboffer_room_regdate = joboffer_room_regdate;
		this.user_idx = user_idx;
		this.company_user_idx = company_user_idx;
		this.joboffer_room_user_status = joboffer_room_user_status;
		this.joboffer_room_company_user_status = joboffer_room_company_user_status;
	}

	public int getJoboffer_room_idx() {
		return joboffer_room_idx;
	}

	public void setJoboffer_room_idx(int joboffer_room_idx) {
		this.joboffer_room_idx = joboffer_room_idx;
	}

	public String getJoboffer_room_regdate() {
		return joboffer_room_regdate;
	}

	public void setJoboffer_room_regdate(String joboffer_room_regdate) {
		this.joboffer_room_regdate = joboffer_room_regdate;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getCompany_user_idx() {
		return company_user_idx;
	}

	public void setCompany_user_idx(int company_user_idx) {
		this.company_user_idx = company_user_idx;
	}

	public String getJoboffer_room_user_status() {
		return joboffer_room_user_status;
	}

	public void setJoboffer_room_user_status(String joboffer_room_user_status) {
		this.joboffer_room_user_status = joboffer_room_user_status;
	}

	public String getJoboffer_room_company_user_status() {
		return joboffer_room_company_user_status;
	}

	public void setJoboffer_room_company_user_status(String joboffer_room_company_user_status) {
		this.joboffer_room_company_user_status = joboffer_room_company_user_status;
	}

	@Override
	public String toString() {
		return "JobofferRoomVo [joboffer_room_idx=" + joboffer_room_idx + ", joboffer_room_regdate="
				+ joboffer_room_regdate + ", user_idx=" + user_idx + ", company_user_idx=" + company_user_idx
				+ ", joboffer_room_user_status=" + joboffer_room_user_status + ", joboffer_room_company_user_status="
				+ joboffer_room_company_user_status + "]";
	}

}
