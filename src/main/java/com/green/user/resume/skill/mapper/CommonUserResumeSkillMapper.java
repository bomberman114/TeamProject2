package com.green.user.resume.skill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonUserResumeSkillMapper {

	void setCommonUserResumeSkill(List<Integer> resumeSkills);

}
