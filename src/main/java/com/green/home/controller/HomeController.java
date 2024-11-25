package com.green.home.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.service.CompanyRecruitService;
import com.green.user.bookmark.mapper.UsersBookmarkMapper;
import com.green.user.bookmark.vo.UserBookmarkVo;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private CompanyRecruitService companyRecruitService;
	
	@Autowired
	private UsersBookmarkMapper usersBookmarkMapper;
	

	@RequestMapping("/")

	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		/*
		skill_stack = "백엔드";
		
		List<HashMap<String, String>> companyHomeRecruiteList = companyRecruitMapper.getCompanyHomeRecruiteList();
		List<HashMap<String, String>> companyRecruiteSkillStackList = companyRecruitMapper.getCompanyRecruiteSkillStackList(skill_stack);
		System.out.println(companyHomeRecruiteList);
		System.out.println(companyRecruiteSkillStackList);
		
		
		mv.addObject("companyHomeRecruiteList", companyHomeRecruiteList);
		mv.addObject("companyRecruiteSkillStackList", companyRecruiteSkillStackList);
		*/
		
		HttpSession session = request.getSession();
		UserVo vo           = (UserVo) session.getAttribute("userLogin");
		
		List<HashMap<String, Object>> companyHomeRecruiteList = companyRecruitService.findAllHomeRecruiteList();
		if(vo != null) {
			List<UserBookmarkVo>          userBookMarkList    = usersBookmarkMapper.findAllById(vo);		
			mv.addObject("userBookMarkList", userBookMarkList);
			System.out.println(userBookMarkList);
		}

		System.out.println(companyHomeRecruiteList);
		mv.addObject("companyHomeRecruiteList", companyHomeRecruiteList);
		
		mv.setViewName("home");
		return mv;
	}

}
