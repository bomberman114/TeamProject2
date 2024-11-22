package com.green.users.resume.service;

import java.util.HashMap;
import java.util.List;

import com.green.skills.vo.SkillVo;
import com.green.user.resume.vo.UserResumeVo;
import com.green.users.vo.UserVo;

public interface UsersResumeService {

	UserVo findUser(UserVo vo);

	void saveResume(HashMap<String, Object> map, List<Integer> resumeSkills);

	List<HashMap<String, Object>> findResumeAll(UserVo vo);

	List<SkillVo> selectSkillfindAllById(String stackId);

	HashMap<String, Object> resumeFindById(HashMap<String, Object> map);

	void updateResume(HashMap<String, Object> map, List<Integer> resumeSkills);

}
