package com.green.user.career.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserCareerMapper {

	void saveResumeCareer(HashMap<String, Object> map);

}
