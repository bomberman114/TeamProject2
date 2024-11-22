package com.green.user.resume.skill.vo;

public class UserResumeSkillVo {
	private int common_user_resume_skill_idx; // 이력서 스킬 번호
	private int skill_idx;                    // 스킬 번호
	private int user_resume_idx;              // 이력서 번호
	
	public UserResumeSkillVo() {}

	public UserResumeSkillVo(int common_user_resume_skill_idx, int skill_idx, int user_resume_idx) {
		super();
		this.common_user_resume_skill_idx = common_user_resume_skill_idx;
		this.skill_idx = skill_idx;
		this.user_resume_idx = user_resume_idx;
	}

	public int getCommon_user_resume_skill_idx() {
		return common_user_resume_skill_idx;
	}

	public void setCommon_user_resume_skill_idx(int common_user_resume_skill_idx) {
		this.common_user_resume_skill_idx = common_user_resume_skill_idx;
	}

	public int getSkill_idx() {
		return skill_idx;
	}

	public void setSkill_idx(int skill_idx) {
		this.skill_idx = skill_idx;
	}

	public int getUser_resume_idx() {
		return user_resume_idx;
	}

	public void setUser_resume_idx(int user_resume_idx) {
		this.user_resume_idx = user_resume_idx;
	}

	@Override
	public String toString() {
		return "UserResumeSkillVo [common_user_resume_skill_idx=" + common_user_resume_skill_idx + ", skill_idx="
				+ skill_idx + ", user_resume_idx=" + user_resume_idx + "]";
	}
	
	
}
