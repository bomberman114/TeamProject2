package com.green.company.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.vo.CompanyUserVo;

@Mapper
public interface CompanyUserMapper {

	HashMap<String, Object> getCompanyUserData(CompanyUserVo companyUserVo);

	void setUpdateCompanyProfile(HashMap<String, Object> map);

}
