package com.green.company.recruit.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.common.duty.vo.CommonDutyVo;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.vo.CompanyUserVo;
import com.green.region.vo.RegionVo;

@Mapper
public interface CompanyRecruitMapper {

	List<HashMap<String, String>> getCompanyHomeRecruiteList();

	List<HashMap<String, String>> getCompanyRecruiteSkillStackList(@Param("skill_stack") String skill_stack);

	List<HashMap<String, Object>> getCompanyRecruiteList(CompanyUserVo companyUserVo);

	List<HashMap<String, String>> getCompanyRecruiteSkillStackList();

	int getCompanyRecruitIdx(CompanyUserVo companyUserVo);

	HashMap<String, Object> getCompanyHomeRecruiteMap(CompanyRecruitVo companyRecruitVo);

	List<HashMap<String, Object>> findAllHomeRecruiteList();

	List<HashMap<String, Object>> getCheckcompanyRecruiteList(CompanyRecruitVo companyRecruitVo);

	void setCompanyRecruitInsert(HashMap<String, Object> map);

	HashMap<String, Object> getCompanyRecruiteMap(CompanyRecruitVo companyRecruitVo);

	void setCompanyRecruitUpdate(HashMap<String, Object> map);

	HashMap<String, Object> getCompanyHistory(int company_recruit_idx);

	/*
	int getSearchCompanyRecruitCountWithConditions(
			@Param("checkedSkillListToTypeString") List<String> checkedSkillListToTypeString,
			@Param("checkedRegionList") List<RegionVo> checkedRegionList,
			@Param("checkedCommonDutyList") List<CommonDutyVo> checkedCommonDutyList);
*/
	

	int getSearchCompanyRecruitCountWithConditions(HashMap<String, Object> map);
  
	List<HashMap<String, Object>> filterRecruitList(HashMap<String, Object> map);
  
	void updateViews(CompanyRecruitVo vo);
  
	List<HashMap<String, Object>> getSearchCompanyRecruitList(HashMap<String, Object> map);


}
