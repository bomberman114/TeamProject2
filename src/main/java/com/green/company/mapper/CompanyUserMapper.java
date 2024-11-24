package com.green.company.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.vo.CompanyUserVo;


@Mapper
public interface CompanyUserMapper {


	HashMap<String, Object> getCompanyUserData(CompanyUserVo companyUserVo);

	void setUpdateCompanyProfile(HashMap<String, Object> map);

	void saveUser(HashMap<String, Object> map);

	CompanyUserVo login(String userid, String passwd);

	Object isUserIdDupCheck(String userId);

	HashMap<String, Integer> getCompanyApplicationStatusIdxList(CompanyUserVo companyUserVo);
}
	