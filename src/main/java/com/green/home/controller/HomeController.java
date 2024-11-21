package com.green.home.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.mapper.CompanyRecruitMapper;

@Controller
public class HomeController {
	
	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;

	@RequestMapping("/")

	public ModelAndView home(@RequestParam(name = "skill_stack",required =false) String skill_stack) {
		ModelAndView mv = new ModelAndView();
		
		skill_stack = "백엔드";
		
		//List<HashMap<String, String>> companyHomeRecruiteList = companyRecruitMapper.getCompanyHomeRecruiteList();
		//List<HashMap<String, String>> companyRecruiteSkillStackList = companyRecruitMapper.getCompanyRecruiteSkillStackList(skill_stack);
		
		//mv.addObject("companyHomeRecruiteList", companyHomeRecruiteList);
		//mv.addObject("companyRecruiteSkillStackList", companyRecruiteSkillStackList);

		mv.setViewName("home");
		return mv;
	}

}
