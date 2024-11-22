package com.green.company.apply.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.application.mapper.ApplicationMapper;
import com.green.company.mapper.CompanyUserMapper;
import com.green.company.recruit.service.CompanyRecruitService;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.vo.CompanyUserVo;
import com.green.user.resume.mapper.UserResumeMapper;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/CompanyApply")
public class CompanyApplyController {

	@Autowired
	private UserResumeMapper userResumeMapper;

	@Autowired
	private ApplicationMapper applicationMapper;

	@Autowired
	private CompanyRecruitService companyRecruitService;

	@Autowired
	private CompanyUserMapper companyUserMapper;

	@RequestMapping("/CompanyRecruitApplyUserResumeAllList")
	public ModelAndView companyRecruitApplyUserResumeAllList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		List<HashMap<String, Object>> companyRecruitApplyUserResumeAllList = companyRecruitService
				.companyRecruitApplyUserResumeAllList(companyUserVo);
		List<HashMap<String, Object>> companyRecruitList = companyRecruitService.getCompanyRecruiteList(companyUserVo);
		List<HashMap<String, Object>> companyRecruitDeadList = companyRecruitService
				.getCompanyRecruiteDeadList(companyUserVo);
		HashMap<String, Integer> applicationStatusIdx = companyUserMapper
				.getCompanyApplicationStatusIdxList(companyUserVo);

		// System.out.println("companyRecruitList:"+companyRecruitList);
		// System.out.println("companyRecruitDeadList:"+companyRecruitDeadList);
		mv.addObject("applicationStatusIdx", applicationStatusIdx);
		mv.addObject("companyRecruitDeadList", companyRecruitDeadList);
		mv.addObject("companyRecruitList", companyRecruitList);
		mv.addObject("companyRecruitApplyUserResumeAllList", companyRecruitApplyUserResumeAllList);
		mv.setViewName("/company/apply/companyRecruitApplyUserResumeAllList");
		return mv;

	}

	@RequestMapping("/CheckedCompanyRecruitApplyUserResumeList")
	public ModelAndView CheckedCompanyRecruitApplyUserResumeList(HttpSession session,
			CompanyRecruitVo companyRecruitVo) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		List<HashMap<String, Object>> checkedCompanyRecruitApplyUserResumeList = companyRecruitService
				.checkedCompanyRecruitApplyUserResumeAllList(companyRecruitVo);
		List<HashMap<String, Object>> companyRecruitList = companyRecruitService.getCompanyRecruiteList(companyUserVo);
		List<HashMap<String, Object>> companyRecruitDeadList = companyRecruitService
				.getCompanyRecruiteDeadList(companyUserVo);
		HashMap<String, Integer> checkedApplicationStatusIdxMap = companyUserMapper
				.getCheckCompanyApplicationStatusIdxMap(companyRecruitVo);
		
		int companyRecruitIdx = companyRecruitVo.getCompany_recruit_idx();
		
		mv.addObject("companyRecruitIdx", companyRecruitIdx);
		mv.addObject("checkedCompanyRecruitApplyUserResumeList", checkedCompanyRecruitApplyUserResumeList);
		mv.addObject("companyRecruitList", companyRecruitList);
		mv.addObject("companyRecruitDeadList", companyRecruitDeadList);
		mv.addObject("checkedApplicationStatusIdxMap", checkedApplicationStatusIdxMap);
		mv.setViewName("/company/apply/companyCheckedRecruitApplyUserResumeAllList");
		return mv;

	}

}
