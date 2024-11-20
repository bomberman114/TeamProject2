package com.green.company.recruit.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.vo.CompanyUserVo;
import com.green.skills.vo.SkillVo;

@Mapper
public interface CompanyRecruitMapper {


	List<HashMap<String, String>> getCompanyHomeRecruiteList();


	List<HashMap<String, String>> getCompanyRecruiteSkillStackList(@Param("skill_stack") String skill_stack);

	List<HashMap<String, Object>> getCompanyRecruiteList(CompanyUserVo companyUserVo);

	int setCompanyRecruitInsert(HashMap<String, Object> map);


	List<HashMap<String, String>> getCompanyRecruiteSkillStackList();


}
