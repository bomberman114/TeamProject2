package com.green.user.resume.skill.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CommonUserResumeSkillMapper {

	void setCommonUserResumeSkill(List<Integer> resumeSkills);

	List<HashMap<String, Object>> skillsfindById(HashMap<String, Object> map);

	void updateCommonUserResumeSkill(@Param(value = "resumeIdx") String resumeIdx, @Param(value = "resumeSkills") List<Integer> resumeSkills);

	void removeCommonUserResumeSkill(HashMap<String, Object> map);



}
