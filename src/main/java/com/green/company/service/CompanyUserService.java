package com.green.company.service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.green.company.vo.CompanyUserVo;

public interface CompanyUserService {

	HashMap<String, Object> getCompanyUserData(CompanyUserVo companyUserVo);

	void setProfileUpdate(HashMap<String, Object> map, MultipartFile[] profileImge);

	void saveUser(HashMap<String, Object> map);

	CompanyUserVo login(String userid, String passwd);

	Boolean isUserIdDupCheck(String userId);

	Boolean isUserExist(String userId, String userPd);

	void deleteProfileImge(HashMap<String, Object> map);
}
