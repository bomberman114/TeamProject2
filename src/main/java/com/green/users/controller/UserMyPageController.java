package com.green.users.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.users.service.UsersService;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users/MyPage")
public class UserMyPageController {
	
	@Autowired
	private UsersService usersService;

	
	@RequestMapping("/Home")
	public ModelAndView mypageHome(
		HttpServletRequest request, HttpServletResponse responese) {
		
		HttpSession session = request.getSession();
		UserVo vo           = (UserVo) session.getAttribute("userLogin");
		vo                  = usersService.findById(vo.getUser_idx());
		String userBirth    = vo.getUser_birth().substring(0,4);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.addObject("userBirth",userBirth);
		mv.setViewName("/users/personalUsers/personalMyPage");
		return mv;
	}
	
	@RequestMapping("/UpdateForm")
	public ModelAndView mypageUpdateForm(
			HttpServletRequest request, HttpServletResponse responese) {
		
		HttpSession session = request.getSession();
		UserVo vo  = (UserVo) session.getAttribute("userLogin");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.setViewName("/users/personalUsers/personalMypageUpdateForm");
		return mv;
	}
	
	@RequestMapping("/Update")
	public String mypageUpdate(@RequestParam HashMap<String, Object> map) {
		usersService.updateUser(map);
		return "redirect:/Users/MyPage/Home";
	}
	
	@RequestMapping("/Resume/List")
	public ModelAndView resumeList(
			HttpServletRequest request, HttpServletResponse responese) {
		
		HttpSession session = request.getSession();
		UserVo vo  = (UserVo) session.getAttribute("userLogin");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.setViewName("/users/resume/personalResumeList");
		return mv;
	}
	
	
	
}
