package com.green.company.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

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

	@Override
	public void saveUser(HashMap<String, Object> map) {
		companyUserMapper.saveUser(map);

	}

	@Override
	public CompanyUserVo login(String userid, String passwd) {
		CompanyUserVo user = companyUserMapper.login(userid, passwd);
		return user;
	}

	@Override
	public Boolean isUserIdDupCheck(String userId) {
		Boolean result = companyUserMapper.isUserIdDupCheck(userId) != null ? true : false;
		return result;
	}

	@Override
	public Boolean isUserExist(String userId, String userPd) {
		Boolean result = companyUserMapper.login(userId, userPd) != null ? true : false;
		return result;
	}

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
		getCompanyUserData.put("COMPANY_SFILE_NAME", companySfileName);

		// 2024-11-07 00:00:00.0
		String companyEstablish = String.valueOf(getCompanyUserData.get("COMPANY_ESTABLISH"));

		String formattedEstablishDate = formatDate(companyEstablish);

		getCompanyUserData.put("COMPANY_ESTABLISH", formattedEstablishDate);

		return getCompanyUserData;
	}

	private String formatDate(String dateStr) {
		// 입력 문자열에서 날짜 부분만 추출
		LocalDate date = LocalDate.parse(dateStr.substring(0, 10), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

		// 한글 형식의 포맷터 생성
		DateTimeFormatter koreanFormatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일", Locale.KOREAN);

		// LocalDate를 한글 형식으로 변환
		return date.format(koreanFormatter);
	}

	@Override
	public void setProfileUpdate(HashMap<String, Object> map, MultipartFile[] profileImge) {
		map.put("uploadPath", uploadPath);
		String companyProfile = "companyProfile";
		map.put("companyProfile", companyProfile);
		System.out.println("setProfileUpdate map:" + map);
		FileImage.save(map, profileImge);
		System.out.println("setProfileUpdate map후:" + map);

		if (map.get("fileList") != null) {
			int companyImageCountCheck = companyImageMapper.setCompanyImageCountCheck(map);
			if (companyImageCountCheck == 0) {
				companyImageMapper.setCompanyImage(map);
			}
			;
		}
		;
		companyUserMapper.setUpdateCompanyProfile(map);

	}

	@Override
	public void deleteProfileImge(HashMap<String, Object> map) {
		List<CompanyImageVo> companyImageList = companyImageMapper.getCompanyProfileImge(map);

		FileImage.deleteCompanyImage(uploadPath, companyImageList);
		companyImageMapper.deleteCompanyImge(map);

	}
}
