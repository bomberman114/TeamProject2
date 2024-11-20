package com.green.users.service;

import java.util.HashMap;

import com.green.users.vo.UserVo;

public interface UsersService {

	void saveUser(HashMap<String, Object> map);

	UserVo login(String userid, String passwd);

	Boolean isUserIdDupCheck(String userId);

	Boolean isUserExist(String userId, String userPd);

	void updateUser(HashMap<String, Object> map);

	UserVo findById(int user_idx);


}
