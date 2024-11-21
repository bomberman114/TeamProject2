package com.green.company.recruit.service.impl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.service.CompanyRecruitService;
import com.green.company.vo.CompanyUserVo;

@Service("CompanyRecruitService")
public class CompanyRecruitServiceImpl implements CompanyRecruitService {
	
	LocalDate now = LocalDate.now();

	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;

	@Override
	public List<HashMap<String, Object>> getCompanyRecruiteList(CompanyUserVo companyUserVo) {
		List<HashMap<String, Object>> companyRecruitList = companyRecruitMapper.getCompanyRecruiteList(companyUserVo);
		// 현재 날짜 구하기
		
		// 지난 공고 제거
		companyRecruitList.removeIf(recruit -> isPastDeadline(recruit, now));
		for(int i = 0; i < companyRecruitList.size(); i++) {
			String companyRecruitRegdate = String.valueOf(companyRecruitList.get(i).get("COMPANY_RECRUIT_REGDATE"));
			String formattedEstablishDate = formatDate(companyRecruitRegdate);
			companyRecruitList.get(i).put("COMPANY_RECRUIT_REGDATE", formattedEstablishDate);
		};
		
		
		return companyRecruitList;
	}

	@Override
	public List<HashMap<String, Object>> getCompanyRecruiteDeadList(CompanyUserVo companyUserVo) {
	    List<HashMap<String, Object>> companyRecruiteDeadList = companyRecruitMapper.getCompanyRecruiteList(companyUserVo);
	    

	    // 마감일이 지나지 않은 항목을 제거하여, 마감일이 지난 항목만 남김
	    companyRecruiteDeadList.removeIf(recruit -> !isPastDeadline(recruit, now));
	    
	    for(int i = 0; i < companyRecruiteDeadList.size(); i++) {
			String companyRecruitRegdate = String.valueOf(companyRecruiteDeadList.get(i).get("COMPANY_RECRUIT_REGDATE"));
			String formattedEstablishDate = formatDate(companyRecruitRegdate);
			companyRecruiteDeadList.get(i).put("COMPANY_RECRUIT_REGDATE", formattedEstablishDate);
		};

	    return companyRecruiteDeadList;
	}
	
	// 마감일이 현재 날짜를 넘었는지 확인하는 메서드
		private boolean isPastDeadline(HashMap<String, Object> recruit, LocalDate now) {
			// 2024-11-07 00:00:00.0
			String applicationDeadlineStr = String.valueOf(recruit.get("APPLICATION_DEADLINE"));
			String companyRecruitRegdate = String.valueOf(recruit.get("COMPANY_RECRUIT_REGDATE"));


			// 입력 문자열에서 날짜 부분만 추출
			LocalDate applicationDeadlineStrFormat = LocalDate.parse(applicationDeadlineStr.substring(0, 10),
					DateTimeFormatter.ofPattern("yyyy-MM-dd"));

			recruit.put("APPLICATION_DEADLINE", applicationDeadlineStr);
			// 마감일이 현재 날짜보다 이전인 경우 true 반환
			return applicationDeadlineStrFormat.isBefore(now);     //isBefore(now);
		}
		
		private String formatDate(String dateStr) {
		    // 입력 문자열에서 날짜 부분만 추출
		    LocalDate date = LocalDate.parse(dateStr.substring(0, 10), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		    
		    // 한글 형식의 포맷터 생성
		    DateTimeFormatter koreanFormatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일", Locale.KOREAN);

		    // LocalDate를 한글 형식으로 변환
		    return date.format(koreanFormatter);
		}

	
}
