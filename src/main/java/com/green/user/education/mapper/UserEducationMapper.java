package com.green.user.education.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserEducationMapper {

	void updateResumeEducation(HashMap<String, Object> map);

	void saveResumeEducation(HashMap<String, Object> map);


}
