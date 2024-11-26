package com.green.users.resume.service.impl;


import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.common.duty.vo.CommonDutyVo;
import com.green.region.vo.RegionVo;
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
	
	 // 현재 날짜 가져오기
    LocalDate now = LocalDate.now();
	
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

	private String formatDate(String dateStr) {
		   // 입력 문자열에서 날짜 부분만 추출 (형식이 yyyy-MM-dd HH:mm:ss.S)
        //LocalDate date = LocalDate.parse(dateStr.substring(0, 10), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        
        // 한글 형식의 포맷터 생성
        //DateTimeFormatter koreanFormatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일", Locale.KOREAN);
	    if(dateStr != null && !dateStr.equals("null")) {
	    	String dateStrYear = dateStr.substring(0,4);
	    	String dateStrMonth = dateStr.substring(4,6);
	    	dateStr = dateStrYear+ "년" + dateStrMonth + "월";
	    };
        // LocalDate를 한글 형식으로 변환
        return dateStr;
    }


	private String getBirthYear(String dateStr) {
		// 입력 문자열에서 날짜 부분만 추출
		// USER_BIRTH=20011010
		LocalDate date = LocalDate.parse(dateStr, DateTimeFormatter.ofPattern("yyyyMMdd"));

		String dateYear = String.valueOf(date.getYear());

		return dateYear;
	}
	
	private String getAge(String dateStr) {
		// USER_BIRTH=20011010
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		
		LocalDate birthDate = LocalDate.parse(dateStr, formatter); // birthDate:2001-10-10
		
	    // 나이 계산
        Period age = Period.between(birthDate, now);
        String ageToString = String.valueOf(age.getYears());
        
		return ageToString;
	}

	public void careerType(HashMap<String, Object> map) {
		String userWookedYearStart = String.valueOf(map.get("USER_WOOKED_YEAR_START")); // 2024-11-22 00:00:00.0
		String userWookedYearEnd = String.valueOf(map.get("USER_WOOKED_YEAR_END")); // 2024-06-01 00:00:00.0
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
		
		//LocalDate startDate = null;
		//LocalDate endDate = null;
		String startDate = null;
		String endDate = null;
		
		long totalMonths = 0;
		
		long startDateYear = 0;
		long endDateYear = 0;
		
		long years = 0;
		long months = 0;
		
		// 날짜 변환
		System.out.println("userWookedYearStart:" + userWookedYearStart);
		if(!userWookedYearStart.equals("null")) {
			//startDate = LocalDate.parse(userWookedYearStart, formatter);
			startDate = userWookedYearStart.substring(0,4);
			startDateYear = Long.parseLong(startDate);
			
		};
		if(!userWookedYearEnd.equals("null")) {
			//endDate = LocalDate.parse(userWookedYearEnd, formatter);
			endDate = userWookedYearEnd.substring(0,4);
			endDateYear = Long.parseLong(endDate);
		};
		if(startDate != null && endDate != null) {
			// 개월 수 계산
			 //totalMonths = ChronoUnit.MONTHS.between(startDate, endDate);
			totalMonths = endDateYear - startDateYear;
			// 년과 개월로 나누기
			years = totalMonths / 12;
			months = totalMonths % 12;
		};
	

		if (years != 0 || months != 0) {
			map.put("CAREER_TYPE", "exp");
		} else {
			map.put("CAREER_TYPE", null);
		}
	}

	@Override
	public void deleteResume(HashMap<String, Object> map) {
		userResumeMapper.deleteResume(map);
	}

	@Override
	public HashMap<String, Object> getuserResumeMap(HashMap<String, Object> map) {
		userResumeMapper.setUpdateUserResumeVIewPlus(map);
		HashMap<String, Object> userResumeMap = userResumeMapper.getuserResumeMap(map);
		System.out.println("전" + userResumeMap);
		String userBirth = String.valueOf(userResumeMap.get("USER_BIRTH"));
		// String.valueOf 를쓰면 null 값은 글자 null이된다.
		String userWookedYearStart = String.valueOf(userResumeMap.get("USER_WOOKED_YEAR_START")); // 2024-11-22
		String userWookedYearEnd = String.valueOf(userResumeMap.get("USER_WOOKED_YEAR_END"));
		// 00:00:00.0
		userBirth = getBirthYear(userBirth);
		userResumeMap.put("USER_BIRTH", userBirth);
		//System.out.println("전userWookedYearStart:" + userWookedYearStart);
		//System.out.println("전userWookedYearEnd:" + userWookedYearEnd);
		if(!userWookedYearStart.equals("null") && !userWookedYearEnd.equals("null")) {
			careerType(userResumeMap);
			userWookedYearStart = formatDate(userWookedYearStart);
			userWookedYearEnd = formatDate(userWookedYearEnd);
		};

		userResumeMap.put("USER_WOOKED_YEAR_START", userWookedYearStart);
		userResumeMap.put("USER_WOOKED_YEAR_END", userWookedYearEnd);

		String skillString = String.valueOf(userResumeMap.get("SKILLS"));
		if (skillString == "null") {
			skillString = "";
		}
		//System.out.println(skillString);
		String[] resumeSkillArr = skillString.split(",");
		userResumeMap.put("SKILLS", Arrays.asList(resumeSkillArr));

		//System.out.println("후" + userResumeMap);
		return userResumeMap;
	}

	@Override
	public List<HashMap<String, Object>> getUserResumeList(List<String> checkedSkillListToTypeString,
			List<RegionVo> checkedRegionList, List<CommonDutyVo> checkedCommonDutyList, int startRow, int endRow
			, String condition
			) {
		 List<HashMap<String, Object>> userResumeList =  
	               userResumeMapper.getUserResumeList(   
	            		   							  checkedSkillListToTypeString
	                                                , checkedRegionList
	                                                , checkedCommonDutyList
	                                                , startRow
	                                                , endRow
	                                                , condition
	            		   );
		 if(userResumeList.size() != 0) {
			 
			 for(int i =0; i < userResumeList.size(); i++) {
				String userResumeRegdate = String.valueOf(userResumeList.get(i).get("USER_RESUME_REGDATE"));
				userResumeRegdate = formatDate(userResumeRegdate);
				userResumeList.get(i).put("USER_RESUME_REGDATE", userResumeRegdate);
				String 	userBirth = String.valueOf(userResumeList.get(i).get("USER_BIRTH"));
				userBirth = getAge(userBirth);
				userResumeList.get(i).put("USER_AGE", userBirth);
		 		};
		 };
		 // USER_BIRTH=19990909, 
		return userResumeList;
	}

}
