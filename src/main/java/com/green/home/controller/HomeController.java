package com.green.home.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.mapper.CompanyRecruitMapper;

@Controller
public class HomeController {
	
	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;

	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		/*
		List<HashMap<String, String>> companyHomeRecruiteList = companyRecruitMapper.getCompanyHomeRecruiteList();
		List<HashMap<String, String>> companyRecruiteSkillStackList = companyRecruitMapper.getCompanyRecruiteSkillStackList();
		*/
		mv.setViewName("home");
		return mv;
	}

}
