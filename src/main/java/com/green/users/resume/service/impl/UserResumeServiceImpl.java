package com.green.users.resume.service.impl;

<<<<<<< HEAD
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.skills.vo.SkillVo;
import com.green.user.career.mapper.UserCareerMapper;
import com.green.user.education.mapper.UserEducationMapper;
=======
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.user.career.mapper.UserCareerMapper;
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
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
<<<<<<< HEAD
	private UserEducationMapper userEducationMapper;
	
	@Autowired
	private UserResumeIntroMapper userResumeIntroMapper;
	
	
	
	
=======
	private UserResumeIntroMapper userResumeIntroMapper;
	
	
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
	@Override
	public UserVo findUser(UserVo vo) {
		UserVo userVo = userResumeMapper.findUser(vo);
		return userVo;
	}

	@Override
	public void saveResume(HashMap<String, Object> map, List<Integer> resumeSkills) {
		userResumeMapper.saveResume(map);
<<<<<<< HEAD
		userEducationMapper.saveResumeEducation(map);
=======
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
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
<<<<<<< HEAD
	    List<HashMap<String, Object>> resumeList = userResumeMapper.findResumeAll(vo);
	    for (HashMap<String, Object> resume : resumeList) {
	        String skillString      = String.valueOf(resume.get("SKILLS"));
	        if(skillString == "null") {skillString = "";}
	        System.out.println(skillString);
	        String[] resumeSkillArr = skillString.split(",");
			// 배열을 List로 변환하여 저장
			resume.put("SKILLS", Arrays.asList(resumeSkillArr));
		}

		return resumeList;
	}

	@Override
	public List<SkillVo> selectSkillfindAllById(String stackId) {
		List<SkillVo> skillList = userResumeMapper.selectSkillfindAllById(stackId);
		return skillList;
	}

	@Override
	public HashMap<String, Object> resumeFindById(HashMap<String, Object> map) {
		HashMap<String, Object> vo = userResumeMapper.resumeFindById(map);
		return vo;
	}

	@Override
	public void updateResume(HashMap<String, Object> map, List<Integer> resumeSkills) {
		System.out.println(map);
		userResumeMapper.updateResume(map);
		userEducationMapper.updateResumeEducation(map);
		userResumeIntroMapper.updateResumeIntro(map);
		String resumeIdx = String.valueOf(map.get("user_resume_idx"));   
		System.out.println(resumeIdx);
		if(resumeSkills != null) {
			commonUserResumeSkillMapper.removeCommonUserResumeSkill(map);			
			commonUserResumeSkillMapper.updateCommonUserResumeSkill(resumeIdx,resumeSkills);			
		}
		if(String.valueOf(map.get("user_resume_career_type")).equals("exp")) {
			userCareerMapper.updateResumeCareer(map);
		}
		
	}


=======
		List<HashMap<String, Object>> resumeList = userResumeMapper.findResumeAll(vo);
		return resumeList;
	}

>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
}
