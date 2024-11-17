package com.green.user.resume.image.vo;

public class UserResumeImageVo {

	private int user_resume_image_idx; // 파일고유번호
	private int user_resume_idx; // 게시글 번호
	private String user_resume_image_name; // 파일이름
	private String user_resume_image_ext; // 파일확장자
	private String user_resume_sfile_name; // 저장된 실제 파일명

	public UserResumeImageVo() {
	}

	public UserResumeImageVo(int user_resume_image_idx, int user_resume_idx, String user_resume_image_name,
			String user_resume_image_ext, String user_resume_sfile_name) {
		super();
		this.user_resume_image_idx = user_resume_image_idx;
		this.user_resume_idx = user_resume_idx;
		this.user_resume_image_name = user_resume_image_name;
		this.user_resume_image_ext = user_resume_image_ext;
		this.user_resume_sfile_name = user_resume_sfile_name;
	}

	public int getUser_resume_image_idx() {
		return user_resume_image_idx;
	}

	public void setUser_resume_image_idx(int user_resume_image_idx) {
		this.user_resume_image_idx = user_resume_image_idx;
	}

	public int getUser_resume_idx() {
		return user_resume_idx;
	}

	public void setUser_resume_idx(int user_resume_idx) {
		this.user_resume_idx = user_resume_idx;
	}

	public String getUser_resume_image_name() {
		return user_resume_image_name;
	}

	public void setUser_resume_image_name(String user_resume_image_name) {
		this.user_resume_image_name = user_resume_image_name;
	}

	public String getUser_resume_image_ext() {
		return user_resume_image_ext;
	}

	public void setUser_resume_image_ext(String user_resume_image_ext) {
		this.user_resume_image_ext = user_resume_image_ext;
	}

	public String getUser_resume_sfile_name() {
		return user_resume_sfile_name;
	}

	public void setUser_resume_sfile_name(String user_resume_sfile_name) {
		this.user_resume_sfile_name = user_resume_sfile_name;
	}

	@Override
	public String toString() {
		return "UserResumeImageVo [user_resume_image_idx=" + user_resume_image_idx + ", user_resume_idx="
				+ user_resume_idx + ", user_resume_image_name=" + user_resume_image_name + ", user_resume_image_ext="
				+ user_resume_image_ext + ", user_resume_sfile_name=" + user_resume_sfile_name + "]";
	}

}
