package com.green.users.resume.service;

import java.util.HashMap;
import java.util.List;

<<<<<<< HEAD
import com.green.skills.vo.SkillVo;
import com.green.user.resume.vo.UserResumeVo;
=======
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
import com.green.users.vo.UserVo;

public interface UsersResumeService {

	UserVo findUser(UserVo vo);

	void saveResume(HashMap<String, Object> map, List<Integer> resumeSkills);

	List<HashMap<String, Object>> findResumeAll(UserVo vo);

<<<<<<< HEAD
	List<SkillVo> selectSkillfindAllById(String stackId);

	HashMap<String, Object> resumeFindById(HashMap<String, Object> map);

	void updateResume(HashMap<String, Object> map, List<Integer> resumeSkills);
=======

>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69

}
