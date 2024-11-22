package com.green.company.mapper;

import java.util.HashMap;
<<<<<<< HEAD
import java.util.List;
=======
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69

import org.apache.ibatis.annotations.Mapper;

import com.green.company.vo.CompanyUserVo;


@Mapper
public interface CompanyUserMapper {


	HashMap<String, Object> getCompanyUserData(CompanyUserVo companyUserVo);

	void setUpdateCompanyProfile(HashMap<String, Object> map);

	void saveUser(HashMap<String, Object> map);

	CompanyUserVo login(String userid, String passwd);

	Object isUserIdDupCheck(String userId);

<<<<<<< HEAD
	HashMap<String, Integer> getCompanyApplicationStatusIdxList(CompanyUserVo companyUserVo);

=======
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
}
	