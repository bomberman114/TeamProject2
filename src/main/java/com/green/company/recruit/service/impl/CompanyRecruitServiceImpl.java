package com.green.company.recruit.service.impl;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

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

		return companyRecruitList;
	}

	@Override
	public List<HashMap<String, Object>> getCompanyRecruiteDeadList(CompanyUserVo companyUserVo) {
	    List<HashMap<String, Object>> companyRecruiteDeadList = companyRecruitMapper.getCompanyRecruiteList(companyUserVo);
	    

	    // 마감일이 지나지 않은 항목을 제거하여, 마감일이 지난 항목만 남김
	    companyRecruiteDeadList.removeIf(recruit -> !isPastDeadline(recruit, now));

	    return companyRecruiteDeadList;
	}
	
	// 마감일이 현재 날짜를 넘었는지 확인하는 메서드
		private boolean isPastDeadline(HashMap<String, Object> recruit, LocalDate now) {
			String applicationDeadlineStr = String.valueOf(recruit.get("APPLICATION_DEADLINE"));

			// 마감일을 LocalDate로 변환
			LocalDate applicationDeadline = LocalDate.parse(applicationDeadlineStr,
					DateTimeFormatter.ofPattern("yyyy/MM/dd"));

			// 마감일이 현재 날짜보다 이전인 경우 true 반환
			return applicationDeadline.isBefore(now);
		}

}
