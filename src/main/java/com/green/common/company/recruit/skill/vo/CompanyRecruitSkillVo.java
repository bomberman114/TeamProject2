package com.green.common.company.recruit.skill.vo;

public class CompanyRecruitSkillVo {
	private int common_company_recruit_skill_idx; // 채용 공고 공통 스킬
	private int skill_idx;                        // 스킬 번호
	private int company_recruit_idx;              // 채용 공고 번호
	
	public CompanyRecruitSkillVo() {}

	public CompanyRecruitSkillVo(int common_company_recruit_skill_idx, int skill_idx, int company_recruit_idx) {
		super();
		this.common_company_recruit_skill_idx = common_company_recruit_skill_idx;
		this.skill_idx = skill_idx;
		this.company_recruit_idx = company_recruit_idx;
	}

	public int getCommon_company_recruit_skill_idx() {
		return common_company_recruit_skill_idx;
	}

	public void setCommon_company_recruit_skill_idx(int common_company_recruit_skill_idx) {
		this.common_company_recruit_skill_idx = common_company_recruit_skill_idx;
	}

	public int getSkill_idx() {
		return skill_idx;
	}

	public void setSkill_idx(int skill_idx) {
		this.skill_idx = skill_idx;
	}

	public int getCompany_recruit_idx() {
		return company_recruit_idx;
	}

	public void setCompany_recruit_idx(int company_recruit_idx) {
		this.company_recruit_idx = company_recruit_idx;
	}

	@Override
	public String toString() {
		return "CompanyRecruitSkillVo [common_company_recruit_skill_idx=" + common_company_recruit_skill_idx
				+ ", skill_idx=" + skill_idx + ", company_recruit_idx=" + company_recruit_idx + "]";
	}
	
	
}
