package com.green.users.resume.service;

import java.util.HashMap;
import java.util.List;

import com.green.users.vo.UserVo;

public interface UsersResumeService {

	UserVo findUser(UserVo vo);

	void saveResume(HashMap<String, Object> map, List<Integer> resumeSkills);

	List<HashMap<String, Object>> findResumeAll(UserVo vo);



}
