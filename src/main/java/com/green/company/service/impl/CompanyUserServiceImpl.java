package com.green.company.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.company.mapper.CompanyUserMapper;
import com.green.company.service.CompanyUserService;
import com.green.company.vo.CompanyUserVo;

@Service("CompanyUserService")
public class CompanyUserServiceImpl implements CompanyUserService {

	@Autowired
	private CompanyUserMapper companyUserMapper;
	
	@Override
	public void saveUser(HashMap<String, Object> map) {
		companyUserMapper.saveUser(map);
		
	}

	@Override
	public CompanyUserVo login(String userid, String passwd) {
		CompanyUserVo user = companyUserMapper.login(userid,passwd);
		return user;
	}

	@Override
	public Boolean isUserIdDupCheck(String userId) {
		Boolean result = companyUserMapper.isUserIdDupCheck(userId) != null ?
				true : false;
		return result;
	}

	@Override
	public Boolean isUserExist(String userId, String userPd) {
		Boolean result = companyUserMapper.login(userId,userPd) != null ?
				true : false;
		return result;
	}

}
