package com.green.user.bookmark.vo;

public class UserBookmarkVo {

	private int bookmark_idx; // 북마크 id
	private int user_idx; // 구직자 id (회원 id)
	private int company_recruit_idx; // 채용공고 번호
	private int bookmark_date; // 북마크한 날짜
	private int bookmark_check; // 북마크 체크 확인

	public UserBookmarkVo() {
	}

	public UserBookmarkVo(int bookmark_idx, int user_idx, int company_recruit_idx, int bookmark_date,
			int bookmark_check) {
		super();
		this.bookmark_idx = bookmark_idx;
		this.user_idx = user_idx;
		this.company_recruit_idx = company_recruit_idx;
		this.bookmark_date = bookmark_date;
		this.bookmark_check = bookmark_check;
	}

	public int getBookmark_idx() {
		return bookmark_idx;
	}

	public void setBookmark_idx(int bookmark_idx) {
		this.bookmark_idx = bookmark_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getCompany_recruit_idx() {
		return company_recruit_idx;
	}

	public void setCompany_recruit_idx(int company_recruit_idx) {
		this.company_recruit_idx = company_recruit_idx;
	}

	public int getBookmark_date() {
		return bookmark_date;
	}

	public void setBookmark_date(int bookmark_date) {
		this.bookmark_date = bookmark_date;
	}

	public int getBookmark_check() {
		return bookmark_check;
	}

	public void setBookmark_check(int bookmark_check) {
		this.bookmark_check = bookmark_check;
	}

	@Override
	public String toString() {
		return "UserBookmarkVo [bookmark_idx=" + bookmark_idx + ", user_idx=" + user_idx + ", company_recruit_idx="
				+ company_recruit_idx + ", bookmark_date=" + bookmark_date + ", bookmark_check=" + bookmark_check + "]";
	}

}
