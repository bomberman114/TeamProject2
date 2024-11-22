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

<<<<<<< HEAD
=======
	
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
	@Value("${part4.upload-path}")
	private String uploadPath;

	@Autowired
	private CompanyImageMapper companyImageMapper;

	@Autowired
	private CompanyUserMapper companyUserMapper;
<<<<<<< HEAD

	@Override
	public void saveUser(HashMap<String, Object> map) {
		companyUserMapper.saveUser(map);

=======
	
	@Override
	public void saveUser(HashMap<String, Object> map) {
		companyUserMapper.saveUser(map);
		
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
	}

	@Override
	public CompanyUserVo login(String userid, String passwd) {
<<<<<<< HEAD
		CompanyUserVo user = companyUserMapper.login(userid, passwd);
=======
		CompanyUserVo user = companyUserMapper.login(userid,passwd);
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
		return user;
	}

	@Override
	public Boolean isUserIdDupCheck(String userId) {
<<<<<<< HEAD
		Boolean result = companyUserMapper.isUserIdDupCheck(userId) != null ? true : false;
=======
		Boolean result = companyUserMapper.isUserIdDupCheck(userId) != null ?
				true : false;
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
		return result;
	}

	@Override
	public Boolean isUserExist(String userId, String userPd) {
<<<<<<< HEAD
		Boolean result = companyUserMapper.login(userId, userPd) != null ? true : false;
		return result;
	}

=======
		Boolean result = companyUserMapper.login(userId,userPd) != null ?
				true : false;
		return result;
	}

	
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
	public String fileNemeReplace(String fileName) {
		fileName = fileName.replace("\\", "/");
		String path = "/img/commonImage/";
		fileName = path + fileName;
		return fileName;
	}
<<<<<<< HEAD

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
=======
	
	@Override
	public HashMap<String, Object> getCompanyUserData(CompanyUserVo companyUserVo) {
		HashMap<String, Object> getCompanyUserData = companyUserMapper.getCompanyUserData(companyUserVo);
		
		String companySfileName = String.valueOf(getCompanyUserData.get("COMPANY_SFILE_NAME"));
		companySfileName = fileNemeReplace(companySfileName);
		getCompanyUserData.put("COMPANY_SFILE_NAME", companySfileName);
		
		//2024-11-07 00:00:00.0
		String companyEstablish = String.valueOf(getCompanyUserData.get("COMPANY_ESTABLISH"));
		
		  // 입력 문자열에서 날짜 부분만 추출
        LocalDate companyEstablishFormat = LocalDate.parse(companyEstablish.substring(0, 10),
                DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        // 한글 형식의 포맷터 생성
        DateTimeFormatter koreanFormatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일", Locale.KOREAN);

        // LocalDate를 한글 형식으로 변환
        String formattedDate = companyEstablishFormat.format(koreanFormatter);
		
		companyEstablish = formattedDate;
		
		getCompanyUserData.put("COMPANY_ESTABLISH", companyEstablish);
		
		return getCompanyUserData;
	}


>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69

	@Override
	public void setProfileUpdate(HashMap<String, Object> map, MultipartFile[] profileImge) {
		map.put("uploadPath", uploadPath);
		String companyProfile = "companyProfile";
		map.put("companyProfile", companyProfile);
<<<<<<< HEAD
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
=======
		FileImage.save(map, profileImge);

		if (map.get("fileList") != null) {
			companyImageMapper.setCompanyImage(map);
		};
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
		companyUserMapper.setUpdateCompanyProfile(map);

	}

	@Override
	public void deleteProfileImge(HashMap<String, Object> map) {
		List<CompanyImageVo> companyImageList = companyImageMapper.getCompanyProfileImge(map);

		FileImage.deleteCompanyImage(uploadPath, companyImageList);
		companyImageMapper.deleteCompanyImge(map);

	}
}
