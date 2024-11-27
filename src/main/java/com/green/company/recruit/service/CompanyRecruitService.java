package com.green.company.recruit.service;

import java.util.HashMap;
import java.util.List;

import com.green.common.duty.vo.CommonDutyVo;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.vo.CompanyUserVo;
import com.green.region.vo.RegionVo;

public interface CompanyRecruitService {

	List<HashMap<String, Object>> getCompanyRecruiteList(CompanyUserVo companyUserVo);

	List<HashMap<String, Object>> getCompanyRecruiteDeadList(CompanyUserVo companyUserVo);

	List<HashMap<String, Object>> companyRecruitApplyUserResumeAllList(HashMap<String, Object> map);

	List<HashMap<String, Object>> checkedCompanyRecruitApplyUserResumeAllList(CompanyRecruitVo companyRecruitVo);


	List<HashMap<String, Object>> findAllHomeRecruiteList();

	HashMap<String, Object> getcompanyRecruitMap(CompanyRecruitVo companyRecruitVo);

	HashMap<String, Object> getCompanyHistory(int company_recruit_idx);

	List<HashMap<String, Object>> getSearchCompanyRecruitList(HashMap<String, Object> map);



}
