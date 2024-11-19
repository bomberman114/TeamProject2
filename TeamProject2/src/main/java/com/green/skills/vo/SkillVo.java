package com.green.skills.vo;

public class SkillVo {

	private String skill_stack; // 스킬구분
	private String skill_name;  // 스킬
	
	public SkillVo () {}
	
	public SkillVo(String skill_stack, String skill_name) {
		super();
		this.skill_stack = skill_stack;
		this.skill_name = skill_name;
	}

	public String getSkill_stack() {
		return skill_stack;
	}

	public void setSkill_stack(String skill_stack) {
		this.skill_stack = skill_stack;
	}

	public String getSkill_name() {
		return skill_name;
	}

	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}

	@Override
	public String toString() {
		return "SkillVo [skill_stack=" + skill_stack + ", skill_name=" + skill_name + "]";
	}

	
}
