package com.green.users.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.green.users.vo.UserVo;

public interface UsersService {

	void saveUser(HashMap<String, Object> map);

	UserVo login(String userid, String passwd);

	Boolean isUserIdDupCheck(String userId);

	Boolean isUserExist(String userId, String userPd);


	void updateUser(HashMap<String, Object> map);

	UserVo findById(int user_idx);

	HashMap<String, Object> findApplyCountListById(Map<String, String> map);

	void userApplySubmit(Map<String, String> map);

	List<HashMap<String, Object>> findApplyList(Map<String, String> map);

	void deleteProfileImge(HashMap<String, Object> map);

	void setProfileUpdate(HashMap<String, Object> map, MultipartFile[] profileImge);

	HashMap<String, Object> getUserData(UserVo vo);



}
