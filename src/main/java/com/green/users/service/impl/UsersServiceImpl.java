package com.green.users.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.green.application.mapper.ApplicationMapper;
import com.green.company.vo.CompanyUserVo;
import com.green.files.FileImage;
import com.green.user.mapper.UserImageMapper;
import com.green.user.mapper.UserMapper;
import com.green.users.service.UsersService;
import com.green.users.vo.UserImageVo;
import com.green.users.vo.UserVo;

@Service("UsersService")
public class UsersServiceImpl implements UsersService {

	@Value("${part4.upload-path}")
	private String uploadPath;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private ApplicationMapper applicationMapper;
	
	@Autowired
	private UserImageMapper userImageMapper;
	
	@Override
	public void saveUser(HashMap<String, Object> map) {
		userMapper.saveUser(map);
		
	}

	@Override
	public UserVo login(String userid, String passwd) {
		UserVo user = userMapper.login(userid,passwd);
		return user;
	}

	@Override
	public Boolean isUserIdDupCheck(String userId) {
		Boolean result = userMapper.isUserIdDupCheck(userId) != null ?
				true : false;
		return result;
	}

	@Override
	public Boolean isUserExist(String userId, String userPd) {
		Boolean result = userMapper.login(userId,userPd) != null ?
				true : false;
		return result;
	}

	@Override
	public void updateUser(HashMap<String, Object> map) {
		userMapper.updateUser(map);
	}

	@Override
	public UserVo findById(int user_idx) {
		UserVo vo = userMapper.findById(user_idx);
		return vo;
	}
	
	public String fileNameReplace(String fileName) {
		fileName = fileName.replace("\\", "/");
		String path = "/img/commonImage/";
		fileName = path + fileName;
		return fileName;
	}

	@Override
	public HashMap<String, Object> getUserData(UserVo vo) {
		HashMap<String, Object> getUserData = userMapper.getUserData(vo);

		String userSfileName = String.valueOf(getUserData.get("USER_SFILE_NAME"));
		userSfileName = fileNameReplace(userSfileName);
		getUserData.put("USER_SFILE_NAME", userSfileName);
		return getUserData;
	}
	
	
	
	
	
	@Override
	public HashMap<String, Object> findApplyCountListById(Map<String, String> map) {
		HashMap<String, Object> applyConutList = applicationMapper.findApplyCountListById(map);
		return applyConutList;
	}


	@Override
	public void userApplySubmit(Map<String, String> map) {
		applicationMapper.userApplySubmit(map);

	}

	@Override
	public List<HashMap<String, Object>> findApplyList(Map<String, String> map) {
		List<HashMap<String, Object>> applyList = applicationMapper.findApplyList(map);
		return applyList;
	}

	@Override
	public void deleteProfileImge(HashMap<String, Object> map) {

		List<UserImageVo> userImageList = userImageMapper.getUserProfileImge(map);

		FileImage.deleteUserImage(uploadPath, userImageList);
		userImageMapper.deleteUserImge(map);
		
	}

	@Override
	public void setProfileUpdate(HashMap<String, Object> map, MultipartFile[] profileImge) {
		map.put("uploadPath", uploadPath);
		String userProfile = "userProfile";
		map.put("userProfile", userProfile);
		FileImage.save(map, profileImge);
		System.out.println("setProfileUpdate map후:"+map);

		if (map.get("fileList") != null) {
			int companyImageCountCheck = userImageMapper.setUserImageCountCheck(map);
			if (companyImageCountCheck == 0) {
				userImageMapper.setUserImage(map);
			};
		};
		
	}


}
