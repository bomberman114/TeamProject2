package com.green.users.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		HashMap<String, Object> userMap = usersService.getUserData(vo);
		vo                  = usersService.findById(vo.getUser_idx());
		String userBirth    = vo.getUser_birth().substring(0,4);
		HashMap<String, String> map = new HashMap<>();
		map.put("userIdx",String.valueOf(vo.getUser_idx()));
		HashMap<String, Object> userApplyCountList = usersService.findApplyCountListById(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",userMap);
		mv.addObject("userBirth",userBirth);
		mv.addObject("userApplyCountList",userApplyCountList);
		mv.setViewName("/users/personalUsers/personalMyPage");
		return mv;
	}
	
	@RequestMapping("/UpdateForm")
	public ModelAndView mypageUpdateForm(
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVo vo  = (UserVo) session.getAttribute("userLogin");
        HashMap<String, Object> userMap = usersService.getUserData(vo);
        System.out.println("userMap" + userMap);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",userMap);
		mv.setViewName("/users/personalUsers/personalMypageUpdateForm");
		return mv;
	}
	
	@RequestMapping("/Update")
	public ModelAndView mypageUpdate(HttpSession session,
			  @RequestParam HashMap<String, Object> map ,
			  @RequestParam(value="profileImge")  MultipartFile[]   profileImge) {
	ModelAndView mv = new ModelAndView();
	UserVo userVo  = (UserVo) session.getAttribute("userLogin");
	map.put("userVo", userVo);
	usersService.updateUser(map);
	usersService.deleteProfileImge(map);
	usersService.setProfileUpdate(map, profileImge);
	
	mv.setViewName("redirect:/Users/MyPage/Home");
	return mv;
	}
	
}
