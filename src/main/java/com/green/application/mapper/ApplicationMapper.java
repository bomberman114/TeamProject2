package com.green.application.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.application.vo.AppllicationVo;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.vo.CompanyUserVo;

@Mapper
public interface ApplicationMapper {

	List<HashMap<String, Object>> companyRecruitApplyUserResumeAllList(CompanyUserVo companyUserVo);

	List<HashMap<String, Object>> checkedCompanyRecruitApplyUserResumeAllList(CompanyRecruitVo companyRecruitVo);

	HashMap<String, Object> findApplyCountListById(Map<String, String> map);

	void userApplySubmit(Map<String, String> map);

	List<HashMap<String, Object>> findApplyList(Map<String, String> map);

	AppllicationVo findById(Map<String, String> map);

	void deleteUserApply(Map<String, String> map);

}
