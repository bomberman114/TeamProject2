package com.green.user.resume.skill.mapper;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
=======
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69

@Mapper
public interface CommonUserResumeSkillMapper {

	void setCommonUserResumeSkill(List<Integer> resumeSkills);

<<<<<<< HEAD
	List<HashMap<String, Object>> skillsfindById(HashMap<String, Object> map);

	void updateCommonUserResumeSkill(@Param(value = "resumeIdx") String resumeIdx, @Param(value = "resumeSkills") List<Integer> resumeSkills);

	void removeCommonUserResumeSkill(HashMap<String, Object> map);



=======
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
}
