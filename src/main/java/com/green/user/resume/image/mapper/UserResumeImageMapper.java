package com.green.user.resume.image.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.user.resume.image.vo.UserResumeImageVo;

@Mapper
public interface UserResumeImageMapper {

	int setUserImageCountCheck(HashMap<String, Object> map);

	void setUserImage(HashMap<String, Object> map);

	void setUpdateUserProfile(HashMap<String, Object> map);

	List<UserResumeImageVo> getUserProfileImge(HashMap<String, Object> map);

	void deleteUserImge(HashMap<String, Object> map);

}
