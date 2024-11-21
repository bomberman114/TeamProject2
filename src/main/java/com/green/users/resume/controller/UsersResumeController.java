package com.green.users.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.users.resume.service.UsersResumeService;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users/MyPage/Resume")
public class UsersResumeController {
	
	@Autowired
	private UsersResumeService usersResumeService;
	
	@RequestMapping("/List")
	public ModelAndView resumeList(
			HttpServletRequest request, HttpServletResponse responese) {
		
		HttpSession session = request.getSession();
		UserVo vo  = (UserVo) session.getAttribute("userLogin");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.setViewName("/users/resume/personalResumeList");
		return mv;
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView resumeWriteForm(
			HttpServletRequest request, HttpServletResponse responese) {
		
		HttpSession session = request.getSession();
		UserVo vo   = (UserVo) session.getAttribute("userLogin");
		CommonDutyVo dutyList = duty
		String userBirthYear = vo.getUser_birth().substring(0,4);
		vo = usersResumeService.findUser(vo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.addObject("userBirthYear",userBirthYear);
		mv.setViewName("/users/resume/personalResumeWriteForm");
		return mv;
	}

}
