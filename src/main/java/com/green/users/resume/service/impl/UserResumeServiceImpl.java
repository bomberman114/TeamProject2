package com.green.users.resume.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.user.career.mapper.UserCareerMapper;
import com.green.user.resume.intro.mapper.UserResumeIntroMapper;
import com.green.user.resume.mapper.UserResumeMapper;
import com.green.user.resume.skill.mapper.CommonUserResumeSkillMapper;
import com.green.users.resume.service.UsersResumeService;
import com.green.users.vo.UserVo;

@Service("UsersResumeService")
public class UserResumeServiceImpl implements UsersResumeService {

	@Autowired
	private UserResumeMapper userResumeMapper;
	
	@Autowired
	private CommonUserResumeSkillMapper commonUserResumeSkillMapper;	
	
	@Autowired
	private UserCareerMapper userCareerMapper;	
	
	@Autowired
	private UserResumeIntroMapper userResumeIntroMapper;
	
	
	@Override
	public UserVo findUser(UserVo vo) {
		UserVo userVo = userResumeMapper.findUser(vo);
		return userVo;
	}

	@Override
	public void saveResume(HashMap<String, Object> map, List<Integer> resumeSkills) {
		userResumeMapper.saveResume(map);
		userResumeIntroMapper.saveResumeIntro(map);
		if(resumeSkills != null) {
			commonUserResumeSkillMapper.setCommonUserResumeSkill(resumeSkills);			
		}
		if(String.valueOf(map.get("user_resume_career_type")).equals("exp")) {
			userCareerMapper.saveResumeCareer(map);
		}
		
	}

	@Override
	public List<HashMap<String, Object>> findResumeAll(UserVo vo) {
		List<HashMap<String, Object>> resumeList = userResumeMapper.findResumeAll(vo);
		return resumeList;
	}

}
