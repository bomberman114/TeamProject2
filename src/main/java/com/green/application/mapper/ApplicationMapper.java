package com.green.application.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.vo.CompanyUserVo;

@Mapper
public interface ApplicationMapper {

	List<HashMap<String, Object>> companyRecruitApplyUserResumeAllList(CompanyUserVo companyUserVo);

	List<HashMap<String, Object>> checkedCompanyRecruitApplyUserResumeAllList(CompanyRecruitVo companyRecruitVo);

}
