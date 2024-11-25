package com.green.user.bookmark.vo;

public class UserBookmarkVo {

	private Integer bookmark_idx; // 북마크 id
	private Integer user_idx; // 구직자 id (회원 id)
	private Integer company_recruit_idx; // 채용공고 번호
	private String  bookmark_date; // 북마크한 날짜
	private Integer bookmark_check; // 북마크 체크 확인

	public UserBookmarkVo() {
	}

	public UserBookmarkVo(Integer bookmark_idx, Integer user_idx, Integer company_recruit_idx, String bookmark_date,
			Integer bookmark_check) {
		this.bookmark_idx = bookmark_idx;
		this.user_idx = user_idx;
		this.company_recruit_idx = company_recruit_idx;
		this.bookmark_date = bookmark_date;
		this.bookmark_check = bookmark_check;
	}

	public Integer getBookmark_idx() {
		return bookmark_idx;
	}

	public void setBookmark_idx(Integer bookmark_idx) {
		this.bookmark_idx = bookmark_idx;
	}

	public Integer getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(Integer user_idx) {
		this.user_idx = user_idx;
	}

	public Integer getCompany_recruit_idx() {
		return company_recruit_idx;
	}

	public void setCompany_recruit_idx(Integer company_recruit_idx) {
		this.company_recruit_idx = company_recruit_idx;
	}

	public String getBookmark_date() {
		return bookmark_date;
	}

	public void setBookmark_date(String bookmark_date) {
		this.bookmark_date = bookmark_date;
	}

	public Integer getBookmark_check() {
		return bookmark_check;
	}

	public void setBookmark_check(Integer bookmark_check) {
		this.bookmark_check = bookmark_check;
	}

	@Override
	public String toString() {
		return "UserBookmarkVo [bookmark_idx=" + bookmark_idx + ", user_idx=" + user_idx + ", company_recruit_idx="
				+ company_recruit_idx + ", bookmark_date=" + bookmark_date + ", bookmark_check=" + bookmark_check + "]";
	}

}
