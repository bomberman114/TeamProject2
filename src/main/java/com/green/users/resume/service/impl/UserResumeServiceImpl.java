package com.green.users.resume.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.user.resume.mapper.UserResumeMapper;
import com.green.user.resume.vo.UserResumeVo;
import com.green.users.resume.service.UsersResumeService;

@Service("UsersResumeService")
public class UserResumeServiceImpl implements UsersResumeService {

	@Autowired
	private UserResumeMapper userResumeMapper;

	private String formatDate(String dateStr) {
		   // 입력 문자열에서 날짜 부분만 추출 (형식이 yyyy-MM-dd HH:mm:ss.S)
        LocalDate date = LocalDate.parse(dateStr.substring(0, 10), 
                DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        
        // 한글 형식의 포맷터 생성
        DateTimeFormatter koreanFormatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일", Locale.KOREAN);
        
        // LocalDate를 한글 형식으로 변환
        return date.format(koreanFormatter);
    }


	private String getBirthYear(String dateStr) {
		// 입력 문자열에서 날짜 부분만 추출
		// USER_BIRTH=20011010
		LocalDate date = LocalDate.parse(dateStr, DateTimeFormatter.ofPattern("yyyyMMdd"));

		String dateYear = String.valueOf(date.getYear());

		return dateYear;
	}

	public void careerType(HashMap<String, Object> map) {
		String userWookedYearStart = String.valueOf(map.get("USER_WOOKED_YEAR_START")); // 2024-11-22 00:00:00.0
		String userWookedYearEnd = String.valueOf(map.get("USER_WOOKED_YEAR_END")); // 2024-06-01 00:00:00.0
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

		// 날짜 변환
		LocalDate startDate = LocalDate.parse(userWookedYearStart, formatter);
		LocalDate endDate = LocalDate.parse(userWookedYearEnd, formatter);

		// 개월 수 계산
		long totalMonths = ChronoUnit.MONTHS.between(startDate, endDate);

		// 년과 개월로 나누기
		long years = totalMonths / 12;
		long months = totalMonths % 12;

		if (years != 0 || months != 0) {
			map.put("CAREER_TYPE", "exp");
		} else {
			map.put("CAREER_TYPE", null);
		}
	}

	@Override
	public HashMap<String, Object> getuserResumeMap(HashMap<String, Object> map) {
		HashMap<String, Object> userResumeMap = userResumeMapper.getuserResumeMap(map);
		//System.out.println("전" + userResumeMap);
		String userBirth = String.valueOf(userResumeMap.get("USER_BIRTH"));
		String userWookedYearStart = String.valueOf(userResumeMap.get("USER_WOOKED_YEAR_START")); // 2024-11-22
		String userWookedYearEnd = String.valueOf(userResumeMap.get("USER_WOOKED_YEAR_END"));
		// 00:00:00.0
		userBirth = getBirthYear(userBirth);
		userResumeMap.put("USER_BIRTH", userBirth);
		careerType(userResumeMap);

		userWookedYearStart = formatDate(userWookedYearStart);
		userWookedYearEnd = formatDate(userWookedYearEnd);
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

}
