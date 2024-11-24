package com.green.users.resume.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.skills.vo.SkillVo;
import com.green.user.career.mapper.UserCareerMapper;
import com.green.user.career.vo.UserCareerVo;
import com.green.user.education.mapper.UserEducationMapper;
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
	private UserEducationMapper userEducationMapper;
	
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
		userEducationMapper.saveResumeEducation(map);
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
		userResumeMapper.updateResume(map);
		userEducationMapper.updateResumeEducation(map);
		userResumeIntroMapper.updateResumeIntro(map);
		UserCareerVo vo = userCareerMapper.resumeCareerfindById(map);
		System.out.println(vo);
		String resumeIdx = String.valueOf(map.get("user_resume_idx"));   
		if(resumeSkills != null) {
			commonUserResumeSkillMapper.removeCommonUserResumeSkill(map);			
			commonUserResumeSkillMapper.updateCommonUserResumeSkill(resumeIdx,resumeSkills);			
		}
		if(String.valueOf(map.get("user_resume_career_type")).equals("exp")) {
			if(vo != null) {
				userCareerMapper.updateResumeCareer(map);				
			}else {
				userCareerMapper.saveResumeCareer(map);				
			}
		}else {
			if(vo != null) {
				userCareerMapper.removeResumeCareer(map);
			}
		}
	}

	@Override
	public void deleteResume(HashMap<String, Object> map) {
		userResumeMapper.deleteResume(map);
	}
}
