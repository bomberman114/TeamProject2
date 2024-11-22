package com.green.user.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.vo.UserVo;

@Mapper
public interface UserMapper {

	void saveUser(HashMap<String, Object> map);

	UserVo login(String userid, String passwd);

	Boolean isUserIdDupCheck(String userId);

	Object isUserExist(String userId, String userPd);

	void updateUser(HashMap<String, Object> map);

	UserVo findById(int user_idx);


}
