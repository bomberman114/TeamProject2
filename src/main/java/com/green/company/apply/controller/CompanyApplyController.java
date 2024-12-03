package com.green.company.apply.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.application.mapper.ApplicationMapper;
import com.green.application.status.mapper.ApplicationStatusMapper;
import com.green.application.status.vo.ApplicationStatusVo;
import com.green.company.mapper.CompanyUserMapper;
import com.green.company.recruit.service.CompanyRecruitService;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.vo.CompanyUserVo;
import com.green.user.resume.mapper.UserResumeMapper;
import com.green.user.resume.vo.UserResumeVo;
import com.green.users.resume.service.UsersResumeService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/CompanyApply")
public class CompanyApplyController {

	@Autowired
	private UserResumeMapper userResumeMapper;

	@Autowired
	private ApplicationMapper applicationMapper;
	
	@Autowired
	private ApplicationStatusMapper applicationStatusMapper;

	@Autowired
	private CompanyRecruitService companyRecruitService;

	@Autowired
	private CompanyUserMapper companyUserMapper;
	
	@Autowired
	private UsersResumeService usersResumeService;

	@RequestMapping("/CompanyRecruitApplyUserResumeAllList")
	public ModelAndView companyRecruitApplyUserResumeAllList(HttpSession session,@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		int company_user_idx = companyUserVo.getCompany_user_idx();
		if(map.get("company_recruit_idx") != null) {
			map.put("company_user_idx", null);
		};
		if(map.get("company_recruit_idx") == null) {
			map.put("company_user_idx", company_user_idx);
		};
		System.out.println("map:" + map);
		List<HashMap<String, Object>> companyRecruitApplyUserResumeAllList = companyRecruitService
				.companyRecruitApplyUserResumeAllList(map);
		List<HashMap<String, Object>> companyRecruitList = companyRecruitService.getCompanyRecruiteList(companyUserVo);
		List<HashMap<String, Object>> companyRecruitDeadList = companyRecruitService
				.getCompanyRecruiteDeadList(companyUserVo);
		HashMap<String, Integer> applicationStatusIdx = companyUserMapper
				.getCompanyApplicationStatusIdxMap(map);
		int companyRecruitIdx = 0;
		
		if(map.get("company_recruit_idx") != null) {
			companyRecruitIdx = Integer.parseInt(String.valueOf(map.get("company_recruit_idx")));
		};
		System.out.println("companyRecruitApplyUserResumeAllList:"+companyRecruitApplyUserResumeAllList);
		String recruitTitle = null;
		if(companyRecruitApplyUserResumeAllList.get(0).get("RECRUIT_TITLE") != null) {
			recruitTitle = String.valueOf(companyRecruitApplyUserResumeAllList.get(0).get("RECRUIT_TITLE"));
		};
		// System.out.println("companyRecruitList:"+companyRecruitList);
		// System.out.println("companyRecruitDeadList:"+companyRecruitDeadList);
		mv.addObject("recruitTitle", recruitTitle);
		mv.addObject("companyRecruitIdx", companyRecruitIdx);
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
		String recruitTitle = String.valueOf(checkedCompanyRecruitApplyUserResumeList.get(0).get("RECRUIT_TITLE"));
		System.out.println("checkedCompanyRecruitApplyUserResumeListController: " + checkedCompanyRecruitApplyUserResumeList);
		mv.addObject("recruitTitle", recruitTitle);
		mv.addObject("companyRecruitIdx", companyRecruitIdx);
		mv.addObject("checkedCompanyRecruitApplyUserResumeList", checkedCompanyRecruitApplyUserResumeList);
		mv.addObject("companyRecruitList", companyRecruitList);
		mv.addObject("companyRecruitDeadList", companyRecruitDeadList);
		mv.addObject("checkedApplicationStatusIdxMap", checkedApplicationStatusIdxMap);
		mv.setViewName("/company/apply/companyCheckedRecruitApplyUserResumeAllList");
		return mv;

	}
	
	@RequestMapping("/CompanyApplyUserResumeView")
	public ModelAndView companyApplyUserResumeView (@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		System.out.println(map);
		HashMap<String, Object> userResumeMap = usersResumeService.getuserResumeMap(map);
		List<ApplicationStatusVo> applicationStatuList = applicationStatusMapper.getapplicationStatuList();
		System.out.println("userResumeMap:" + userResumeMap);
		mv.addObject("vo", userResumeMap);
		mv.addObject("applicationStatuList", applicationStatuList);
		mv.setViewName("/company/apply/companyApplyUserResumeView");
		return mv;
		
	}
	
	@RequestMapping("/CompanyApplyUserResumeChangeApply")
	public String companyApplyUserResumeChangeApply(@RequestParam HashMap<String, Object> map
			,RedirectAttributes redirectAttributes
			) {
		//ModelAndView mv = new ModelAndView();
		System.out.println(map);
		userResumeMapper.updateUserResumeApply(map);
		redirectAttributes.addAllAttributes(map);
		//mv.addObject("map", map);
		//mv.setViewName("redirect:/CompanyApply/CompanyApplyUserResumeView");
		return "redirect:/CompanyApply/CompanyApplyUserResumeView";
		
	}
	

}
