package com.green.users.vo;

public class UserImageVo {

	private int    user_image_idx;  // 파일고유번호
	private int    user_idx;        // 유저고유번호
	private String user_image_name; // 파일이름
	private String user_image_ext;  // 파일확장자
	private String user_sfile_name; // 저장된 실제 파일명

	public UserImageVo() {
	}

	public UserImageVo(int user_image_idx, int user_idx, String user_image_name, String user_image_ext,
			String user_sfile_name) {
		this.user_image_idx = user_image_idx;
		this.user_idx = user_idx;
		this.user_image_name = user_image_name;
		this.user_image_ext = user_image_ext;
		this.user_sfile_name = user_sfile_name;
	}

	public int getUser_image_idx() {
		return user_image_idx;
	}

	public void setUser_image_idx(int user_image_idx) {
		this.user_image_idx = user_image_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_image_name() {
		return user_image_name;
	}

	public void setUser_image_name(String user_image_name) {
		this.user_image_name = user_image_name;
	}

	public String getUser_image_ext() {
		return user_image_ext;
	}

	public void setUser_image_ext(String user_image_ext) {
		this.user_image_ext = user_image_ext;
	}

	public String getUser_sfile_name() {
		return user_sfile_name;
	}

	public void setUser_sfile_name(String user_sfile_name) {
		this.user_sfile_name = user_sfile_name;
	}

	@Override
	public String toString() {
		return "UserImageVo [user_image_idx=" + user_image_idx + ", user_idx=" + user_idx + ", user_image_name="
				+ user_image_name + ", user_image_ext=" + user_image_ext + ", user_sfile_name=" + user_sfile_name + "]";
	}

	

}
