package com.green.common.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.service.CompanyRecruitService;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.user.bookmark.mapper.UsersBookmarkMapper;
import com.green.user.bookmark.vo.UserBookmarkVo;
import com.green.users.resume.service.UsersResumeService;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Common")
public class commonController {
	
	@Autowired
	private CompanyRecruitService companyRecruitService;
	
	@Autowired
	private UsersResumeService usersResumeService;
	
	@Autowired
	private UsersBookmarkMapper usersBookmarkMapper;
	
	@RequestMapping("/RecruitOneView")
	public ModelAndView  commonRecruitOneView(CompanyRecruitVo vo, HttpServletRequest request) {
		HashMap<String, Object> map = companyRecruitService.getcompanyRecruitMap(vo);
        String skillString          = String.valueOf(map.get("SKILL_NAME"));
        
        if(skillString == "null") {skillString = "";}
        
        String[] resumeSkillArr = skillString.split(",");
		// 배열을 List로 변환하여 저장
        map.put("SKILLS", Arrays.asList(resumeSkillArr));
        HashMap<String, Object> companyHistory = companyRecruitService.getCompanyHistory(vo.getCompany_recruit_idx());

        ModelAndView mv = new ModelAndView();
		HttpSession                   session      = request.getSession();
		UserVo                        userVo       = (UserVo) session.getAttribute("userLogin");
		if(userVo != null) {
			List<HashMap<String, Object>> resumeList       = usersResumeService.findResumeAll(userVo);
			int                           resumeCount      = usersResumeService.countById(userVo);
			List<UserBookmarkVo>          userBookMarkList = usersBookmarkMapper.findAllById(userVo);	
			mv.addObject("resumeList",resumeList);
			mv.addObject("resumeCount",resumeCount);
			mv.addObject("userBookMarkList", userBookMarkList);
		}

		mv.addObject("vo",map);
		mv.addObject("companyHistory",companyHistory);
		mv.setViewName("/common/commonRecruitOneView");
		return mv;
	}
}
