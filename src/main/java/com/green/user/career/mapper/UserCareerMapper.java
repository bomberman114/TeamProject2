package com.green.user.career.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.green.user.career.vo.UserCareerVo;

@Mapper
public interface UserCareerMapper {

	void saveResumeCareer(HashMap<String, Object> map);

	UserCareerVo resumeCareerfindById(HashMap<String, Object> map);

	void updateResumeCareer(HashMap<String, Object> map);

	void removeResumeCareer(HashMap<String, Object> map);

	void ifNullsaveResumeCareer(HashMap<String, Object> map);

}
