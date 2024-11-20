package com.green.company.service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.green.company.vo.CompanyUserVo;

public interface CompanyUserService {

	HashMap<String, Object> getCompanyUserData(CompanyUserVo companyUserVo);

	void setProfileUpdate(HashMap<String, Object> map, MultipartFile[] profileImge);


	void deleteProfileImge(HashMap<String, Object> map);

}
