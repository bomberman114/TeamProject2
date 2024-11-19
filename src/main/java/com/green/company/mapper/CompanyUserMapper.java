package com.green.company.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.vo.CompanyUserVo;
import com.green.users.vo.UserVo;

@Mapper
public interface CompanyUserMapper {

	void saveUser(HashMap<String, Object> map);

	CompanyUserVo login(String userid, String passwd);

	Object isUserIdDupCheck(String userId);

}
	