package com.green.skills.stack.vo;

public class SkillStackVo {

	private int skill_stack_idx;
	private String skill_stack_name;

	public SkillStackVo() {
	}

	public SkillStackVo(int skill_stack_idx, String skill_stack_name) {
		super();
		this.skill_stack_idx = skill_stack_idx;
		this.skill_stack_name = skill_stack_name;
	}

	public int getSkill_stack_idx() {
		return skill_stack_idx;
	}

	public void setSkill_stack_idx(int skill_stack_idx) {
		this.skill_stack_idx = skill_stack_idx;
	}

	public String getSkill_stack_name() {
		return skill_stack_name;
	}

	public void setSkill_stack_name(String skill_stack_name) {
		this.skill_stack_name = skill_stack_name;
	}

	@Override
	public String toString() {
		return "SkillStackVo [skill_stack_idx=" + skill_stack_idx + ", skill_stack_name=" + skill_stack_name + "]";
	}

}
