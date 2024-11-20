package com.green.joboffer.message.vo;

public class JobofferMessageVo {
	private int       joboffer_message_idx;              // 메세지 번호
	private int       joboffer_room_idx;                 // 포지션 제안 룸 번호
	private int       user_idx;                          // 개인 회원 번호
	private int       company_user_idx;                  // 기업 회원 번호
	private String    user_message_content;              // 개인 회원 메세지 내용
	private String    company_user_message_content;      // 기업 회원 메세지 내용
	private String    user_status;                       // 개인 유저 상태(나감,있음)
	private String    company_user_status;               // 기업 유저 상태(나감,있음)
	private String    message_content_joboffer_regdate;  // 메세지 입력 시간 
	
	public JobofferMessageVo() {}
	
	public JobofferMessageVo(int joboffer_message_idx, int joboffer_room_idx, int user_idx, int company_user_idx,
			String user_message_content, String company_user_message_content, String user_status,
			String company_user_status, String message_content_joboffer_regdate) {
		super();
		this.joboffer_message_idx = joboffer_message_idx;
		this.joboffer_room_idx = joboffer_room_idx;
		this.user_idx = user_idx;
		this.company_user_idx = company_user_idx;
		this.user_message_content = user_message_content;
		this.company_user_message_content = company_user_message_content;
		this.user_status = user_status;
		this.company_user_status = company_user_status;
		this.message_content_joboffer_regdate = message_content_joboffer_regdate;
	}

	public int getJoboffer_message_idx() {
		return joboffer_message_idx;
	}

	public void setJoboffer_message_idx(int joboffer_message_idx) {
		this.joboffer_message_idx = joboffer_message_idx;
	}

	public int getJoboffer_room_idx() {
		return joboffer_room_idx;
	}

	public void setJoboffer_room_idx(int joboffer_room_idx) {
		this.joboffer_room_idx = joboffer_room_idx;
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

	public String getUser_message_content() {
		return user_message_content;
	}

	public void setUser_message_content(String user_message_content) {
		this.user_message_content = user_message_content;
	}

	public String getCompany_user_message_content() {
		return company_user_message_content;
	}

	public void setCompany_user_message_content(String company_user_message_content) {
		this.company_user_message_content = company_user_message_content;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public String getCompany_user_status() {
		return company_user_status;
	}

	public void setCompany_user_status(String company_user_status) {
		this.company_user_status = company_user_status;
	}

	public String getMessage_content_joboffer_regdate() {
		return message_content_joboffer_regdate;
	}

	public void setMessage_content_joboffer_regdate(String message_content_joboffer_regdate) {
		this.message_content_joboffer_regdate = message_content_joboffer_regdate;
	}

	@Override
	public String toString() {
		return "JobofferMessageVo [joboffer_message_idx=" + joboffer_message_idx + ", joboffer_room_idx="
				+ joboffer_room_idx + ", user_idx=" + user_idx + ", company_user_idx=" + company_user_idx
				+ ", user_message_content=" + user_message_content + ", company_user_message_content="
				+ company_user_message_content + ", user_status=" + user_status + ", company_user_status="
				+ company_user_status + ", message_content_joboffer_regdate=" + message_content_joboffer_regdate + "]";
	}
	
	

}
