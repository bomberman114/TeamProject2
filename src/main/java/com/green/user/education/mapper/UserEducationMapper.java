package com.green.user.education.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.green.user.education.vo.UserEducationVo;

@Mapper
public interface UserEducationMapper {

	void saveResumeEducation(HashMap<String, Object> map);

	void updateResumeEducation(HashMap<String, Object> map);

}
