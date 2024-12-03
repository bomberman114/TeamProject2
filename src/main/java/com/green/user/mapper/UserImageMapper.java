package com.green.user.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.vo.UserImageVo;

@Mapper
public interface UserImageMapper {

	List<UserImageVo> getUserProfileImge(HashMap<String, Object> map);

	void deleteUserImge(HashMap<String, Object> map);

	int setUserImageCountCheck(HashMap<String, Object> map);

	void setUserImage(HashMap<String, Object> map);

	void setUpdateUserProfile(HashMap<String, Object> map);

}
