package com.green.skills.vo;

public class SkillVo {

	private int skill_idx;
	private int skill_stack_idx; // 스킬구분
	private String skill_name; // 스킬

	
	
	
	public SkillVo() {}
	
	public SkillVo(int skill_idx, int skill_stack_idx, String skill_name) {
		super();
		this.skill_idx = skill_idx;
		this.skill_stack_idx = skill_stack_idx;
		this.skill_name = skill_name;
	}

	public int getSkill_idx() {
		return skill_idx;
	}

	public void setSkill_idx(int skill_idx) {
		this.skill_idx = skill_idx;
	}

	public int getSkill_stack_idx() {
		return skill_stack_idx;
	}

	public void setSkill_stack_idx(int skill_stack_idx) {
		this.skill_stack_idx = skill_stack_idx;
	}

	public String getSkill_name() {
		return skill_name;
	}

	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}

	@Override
	public String toString() {
		return "SkillVo [skill_idx=" + skill_idx + ", skill_stack_idx=" + skill_stack_idx + ", skill_name=" + skill_name
				+ "]";
	}
}
