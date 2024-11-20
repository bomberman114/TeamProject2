package com.green.company.service;

import java.util.HashMap;

import com.green.company.vo.CompanyUserVo;

public interface CompanyUserService {

	void saveUser(HashMap<String, Object> map);

	CompanyUserVo login(String userid, String passwd);

	Boolean isUserIdDupCheck(String userId);

	Boolean isUserExist(String userId, String userPd);

}

