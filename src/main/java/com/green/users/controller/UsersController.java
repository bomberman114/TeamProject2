package com.green.users.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.users.service.UsersService;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users")
public class UsersController {
	
	@Autowired
	private UsersService usersService;

	@RequestMapping("/RegisterForm")
	public String registerForm() {
		return "users/personalRegisterForm";
	}
	
	@RequestMapping("/IdDupCheck")
	public ResponseEntity<HashMap<String,Boolean>> idDupCheck(
			@RequestBody Map<String,String> map
			) {
		String userId = map.get("userId");
		Boolean isDuplicate = usersService.isUserIdDupCheck(userId);
		HashMap<String,Boolean> res = new HashMap<>();
		res.put("isDuplicate", isDuplicate);
		System.out.println(res);
		return ResponseEntity.ok(res);
	}
	
	@RequestMapping("/IsUserExist")
	public ResponseEntity<HashMap<String,Boolean>> isUserExist(
			@RequestBody Map<String,String> map
			) {
		String userId = map.get("userId");
		String userPd = map.get("userPd");
		Boolean isExist = usersService.isUserExist(userId,userPd);
		System.out.println(isExist);
		HashMap<String,Boolean> res = new HashMap<>();
		res.put("isExist", isExist);
		return ResponseEntity.ok(res);
	}
	
	
	@RequestMapping("/Register")
	public String register(@RequestParam HashMap<String, Object> map) {
		System.out.println(map);
		usersService.saveUser(map);
		return "redirect:/Users/LoginForm";
	}
	
	@RequestMapping("/LoginForm")
	public String loginForm() {
		return "users/personalLoginForm";
	}
	
	@PostMapping("/Login")
	public String login(HttpServletRequest requset,
					    HttpServletRequest response ) {

		String 		 userid = requset.getParameter("user_id");
		String 		 passwd = requset.getParameter("user_passwd");
		UserVo 		 vo     = usersService.login(userid,passwd);
		
		HttpSession session = requset.getSession();
		session.setAttribute("userLogin", vo);
		return "redirect:/";
	}	
	
	// /Users/Logout 
	@RequestMapping(
		value =	"/Logout",
		method = RequestMethod.GET)
	public String Logout(
			HttpServletRequest requset,
			HttpServletRequest response,
			HttpSession        session) {
		session.invalidate();
		return "redirect:/";
	}
}
