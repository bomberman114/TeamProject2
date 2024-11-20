package com.green.company.service.Impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.green.company.image.mapper.CompanyImageMapper;
import com.green.company.image.vo.CompanyImageVo;
import com.green.company.mapper.CompanyUserMapper;
import com.green.company.service.CompanyUserService;
import com.green.company.vo.CompanyUserVo;
import com.green.files.FileImage;

@Service("CompanyUserService")
public class CompanyUserServiceImpl implements CompanyUserService {

	@Value("${part4.upload-path}")
	private String uploadPath;

	@Autowired
	private CompanyImageMapper companyImageMapper;

	@Autowired
	private CompanyUserMapper companyUserMapper;

	
	public String fileNemeReplace(String fileName) {
		fileName = fileName.replace("\\", "/");
		String path = "/img/commonImage/";
		fileName = path + fileName;
		return fileName;
	}
	
	@Override
	public HashMap<String, Object> getCompanyUserData(CompanyUserVo companyUserVo) {
		HashMap<String, Object> getCompanyUserData = companyUserMapper.getCompanyUserData(companyUserVo);
		String companySfileName = String.valueOf(getCompanyUserData.get("COMPANY_SFILE_NAME"));
		companySfileName = fileNemeReplace(companySfileName);
		getCompanyUserData.put("companySfileName", companySfileName);
		return getCompanyUserData;
	}



	@Override
	public void setProfileUpdate(HashMap<String, Object> map, MultipartFile[] profileImge) {
		map.put("uploadPath", uploadPath);
		String companyProfile = "companyProfile";
		map.put("companyProfile", companyProfile);
		FileImage.save(map, profileImge);

		if (map.get("fileList") != null) {
			companyImageMapper.setCompanyImage(map);
		};
		companyUserMapper.setUpdateCompanyProfile(map);

	}

	@Override
	public void deleteProfileImge(HashMap<String, Object> map) {
		List<CompanyImageVo> companyImageList = companyImageMapper.getCompanyProfileImge(map);

		FileImage.deleteCompanyImage(uploadPath, companyImageList);
		companyImageMapper.deleteCompanyImge(map);

	}
}
