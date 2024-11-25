package com.green.common.company.recruit.skill.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.common.company.recruit.skill.vo.CompanyRecruitSkillVo;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.skills.vo.SkillVo;

@Mapper
public interface CommonCompanyRecruitSkillMapper {

	void setCommonCompanyRecruitSkill(@Param("company_recruit_idx") int company_recruit_idx,@Param("checkedSkillList") List<SkillVo> checkedSkillList);

	List<HashMap<String, Object>> getCompanyRecruitMySkillList(CompanyRecruitVo companyRecruitVo);

	void deleteCommonCompanyRecruitSkill(@Param("company_recruit_idx") int company_recruit_idx);

}
