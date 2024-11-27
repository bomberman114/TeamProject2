package com.green.company.recruit.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.application.mapper.ApplicationMapper;
import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.service.CompanyRecruitService;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.vo.CompanyUserVo;

@Service("CompanyRecruitService")
public class CompanyRecruitServiceImpl implements CompanyRecruitService {

	LocalDate now = LocalDate.now();

	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;

	@Autowired
	private ApplicationMapper applicationMapper;
	
	// 파일경로바꾸기
	public String fileNemeReplace(String fileName) {
		fileName = fileName.replace("\\", "/");
		String path = "/img/commonImage/";
		fileName = path + fileName;
		return fileName;
	}
	
	
	// 마감일이 현재 날짜를 넘었는지 확인하는 메서드
		private boolean isPastDeadline(HashMap<String, Object> recruit, LocalDate now) {
			// 2024-11-07 00:00:00.0
			String applicationDeadlineStr = String.valueOf(recruit.get("APPLICATION_DEADLINE"));

			// 입력 문자열에서 날짜 부분만 추출
			LocalDate applicationDeadlineStrFormat = LocalDate.parse(applicationDeadlineStr.substring(0, 10),
					DateTimeFormatter.ofPattern("yyyy-MM-dd"));

			recruit.put("APPLICATION_DEADLINE", applicationDeadlineStr);
			// 마감일이 현재 날짜보다 이전인 경우 true 반환
			return applicationDeadlineStrFormat.isAfter(now); // isBefore(now);
		}

		private String formatDate(String dateStr) {
			// 입력 문자열에서 날짜 부분만 추출
			LocalDate date = LocalDate.parse(dateStr.substring(0, 10), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

			// 한글 형식의 포맷터 생성
			DateTimeFormatter koreanFormatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일", Locale.KOREAN);

			// LocalDate를 한글 형식으로 변환
			return date.format(koreanFormatter);
		}


	@Override
	public List<HashMap<String, Object>> getCompanyRecruiteList(CompanyUserVo companyUserVo) {
		List<HashMap<String, Object>> companyRecruitList = companyRecruitMapper.getCompanyRecruiteList(companyUserVo);

		// 지난 공고 제거
		companyRecruitList.removeIf(recruit -> !isPastDeadline(recruit, now));

		for (int i = 0; i < companyRecruitList.size(); i++) {
			String companyRecruitRegdate = String.valueOf(companyRecruitList.get(i).get("COMPANY_RECRUIT_REGDATE"));
			String formattedEstablishDate = formatDate(companyRecruitRegdate);
			companyRecruitList.get(i).put("COMPANY_RECRUIT_REGDATE", formattedEstablishDate);
		};

		return companyRecruitList;
	}

	@Override
	public List<HashMap<String, Object>> getCompanyRecruiteDeadList(CompanyUserVo companyUserVo) {
		List<HashMap<String, Object>> companyRecruiteDeadList = companyRecruitMapper
				.getCompanyRecruiteList(companyUserVo);

		// 마감일이 지나지 않은 항목을 제거하여, 마감일이 지난 항목만 남김
		companyRecruiteDeadList.removeIf(recruit -> isPastDeadline(recruit, now));

		for (int i = 0; i < companyRecruiteDeadList.size(); i++) {
			String companyRecruitRegdate = String
					.valueOf(companyRecruiteDeadList.get(i).get("COMPANY_RECRUIT_REGDATE"));
			String formattedEstablishDate = formatDate(companyRecruitRegdate);
			companyRecruiteDeadList.get(i).put("COMPANY_RECRUIT_REGDATE", formattedEstablishDate);
		};
		return companyRecruiteDeadList;
	}
	
	public void datetotalMonths (HashMap<String, Object> map) {
		String startDateString = (String) map.get("USER_WOOKED_YEAR_START");
		String endDateString = (String) map.get("USER_WOOKED_YEAR_END");
		if(startDateString != null && endDateString != null) {
			
			String startDateYear = startDateString.substring(0,4).trim();
			String endDateYear = endDateString.substring(0,4).trim();
			long starYearLong = Long.parseLong(startDateYear);
			long endYearLong = Long.parseLong(endDateYear);
			String startDateMonth = startDateString.substring(4,6).trim();
			String endDateMonth = endDateString.substring(4,6).trim();
			long starMonthLong = Long.parseLong(startDateMonth);
			long endMonthLong = Long.parseLong(endDateMonth);
			// 개월 수 계산
			long years = endYearLong - starYearLong;
			
			long months = Math.abs(starMonthLong - endMonthLong);
			
			
			map.put("years", years);
			map.put("months", months);
		};
		//map.put("careerCheck", "true");
		
	}
	
	@Override
	public List<HashMap<String, Object>> companyRecruitApplyUserResumeAllList(CompanyUserVo companyUserVo) {
		List<HashMap<String, Object>> companyRecruitApplyUserResumeAllList = applicationMapper
				.companyRecruitApplyUserResumeAllList(companyUserVo);

		//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
		 //DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
		for (int i = 0; i < companyRecruitApplyUserResumeAllList.size(); i++) {
			// 2024-11-07 00:00:00.0
			// USER_WOOKED_YEAR_START=202004
			datetotalMonths(companyRecruitApplyUserResumeAllList.get(i));

		};

		System.out.println("companyRecruitApplyUserResumeAllList Service:" + companyRecruitApplyUserResumeAllList);
		return companyRecruitApplyUserResumeAllList;
	}

	@Override
	public List<HashMap<String, Object>> checkedCompanyRecruitApplyUserResumeAllList(
			CompanyRecruitVo companyRecruitVo) {
		List<HashMap<String, Object>> checkedCompanyRecruitApplyUserResumeAllList = applicationMapper
				.checkedCompanyRecruitApplyUserResumeAllList(companyRecruitVo);

		for (int i = 0; i < checkedCompanyRecruitApplyUserResumeAllList.size(); i++) {
			// 2024-11-07 00:00:00.0
			datetotalMonths(checkedCompanyRecruitApplyUserResumeAllList.get(i));

		};
		return checkedCompanyRecruitApplyUserResumeAllList;

	}

		@Override
		public List<HashMap<String, Object>> findAllHomeRecruiteList() {
			List<HashMap<String, Object>> homeRecruitList =  companyRecruitMapper.findAllHomeRecruiteList();
			for(int i = 0; i < homeRecruitList.size(); i++) {
				
				String companySfileName = String.valueOf(homeRecruitList.get(i).get("COMPANY_SFILE_NAME"));
				if(!companySfileName.equals("null")) {
					companySfileName = fileNemeReplace(companySfileName);
					homeRecruitList.get(i).put("COMPANY_SFILE_NAME", companySfileName);
				};
			};
			
			return homeRecruitList;
		}


	@Override
	public HashMap<String, Object> getcompanyRecruitMap(CompanyRecruitVo companyRecruitVo) {
		HashMap<String, Object> companyRecruitMap = companyRecruitMapper.getCompanyRecruiteMap(companyRecruitVo);
		String applicationDeadline = String.valueOf(companyRecruitMap.get("APPLICATION_DEADLINE"));
		applicationDeadline = formatDate(applicationDeadline);
		companyRecruitMap.put("APPLICATION_DEADLINE", applicationDeadline);
		String skillString = String.valueOf(companyRecruitMap.get("SKILL_NAME"));
		if (skillString == "null") {
			skillString = "";
		}
		//System.out.println(skillString);
		String[] resumeSkillArr = skillString.split(",");
		companyRecruitMap.put("SKILLS", Arrays.asList(resumeSkillArr));
		return companyRecruitMap;
	}

	@Override
	public HashMap<String, Object> getCompanyHistory(int company_recruit_idx) {
		HashMap<String, Object> map = companyRecruitMapper.getCompanyHistory(company_recruit_idx);
		return map;
	}

	
	/* 채용정보 공고 필터 */

	@Override
	public List<HashMap<String, Object>> filterRecruitList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> recruitList = companyRecruitMapper.filterRecruitList(map); 
		return recruitList;
	}

}
