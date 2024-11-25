package com.green.common.controller;

import java.util.Arrays;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.service.CompanyRecruitService;
import com.green.company.recruit.vo.CompanyRecruitVo;

@Controller
@RequestMapping("/Common")
public class commonController {
	
	@Autowired
	private CompanyRecruitService companyRecruitService;
	
	@RequestMapping("/RecruitOneView")
	public ModelAndView  commonRecruitOneView(CompanyRecruitVo vo) {
		HashMap<String, Object> map = companyRecruitService.getcompanyRecruitMap(vo);
        String skillString          = String.valueOf(map.get("SKILL_NAME"));
        if(skillString == "null") {skillString = "";}
        String[] resumeSkillArr = skillString.split(",");
		// 배열을 List로 변환하여 저장
        map.put("SKILLS", Arrays.asList(resumeSkillArr));
        HashMap<String, Object> companyHistory = companyRecruitService.getCompanyHistory(vo.getCompany_recruit_idx());
        System.out.println(companyHistory);
        
		ModelAndView mv = new ModelAndView();
		System.out.println(map);
		mv.addObject("vo",map);
		mv.addObject("companyHistory",companyHistory);
		mv.setViewName("/common/commonRecruitOneView");
		return mv;
	}
}
