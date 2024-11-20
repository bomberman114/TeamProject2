package com.green.company.recruit.service;

import java.util.HashMap;
import java.util.List;

import com.green.company.vo.CompanyUserVo;

public interface CompanyRecruitService {

	List<HashMap<String, Object>> getCompanyRecruiteList(CompanyUserVo companyUserVo);

	List<HashMap<String, Object>> getCompanyRecruiteDeadList(CompanyUserVo companyUserVo);

}
