package com.green.company.controller;

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

import com.green.company.service.CompanyUserService;
import com.green.company.vo.CompanyUserVo;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Company")
public class CompanyController {
	
	@Autowired
	private CompanyUserService companyUserService;
	
	@RequestMapping("/LoginForm")
	public String loginForm() {
		return "company/companyLoginForm";
	}
	
	@RequestMapping("/RegisterForm")
	public String registerForm() {
		return "company/companyRegisterForm";
	}

	@RequestMapping("/IdDupCheck")
	public ResponseEntity<HashMap<String,Boolean>> idDupCheck(
			@RequestBody Map<String,String> map
			) {
		String userId = map.get("userId");
		Boolean isDuplicate = companyUserService.isUserIdDupCheck(userId);
		HashMap<String,Boolean> res = new HashMap<>();
		res.put("isDuplicate", isDuplicate);
		return ResponseEntity.ok(res);
	}
	
	@RequestMapping("/IsUserExist")
	public ResponseEntity<HashMap<String,Boolean>> isUserExist(
			@RequestBody Map<String,String> map
			) {
		String userId = map.get("userId");
		String userPd = map.get("userPd");
		Boolean isExist = companyUserService.isUserExist(userId,userPd);
		System.out.println(isExist);
		HashMap<String,Boolean> res = new HashMap<>();
		res.put("isExist", isExist);
		return ResponseEntity.ok(res);
	}
	
	
	@RequestMapping("/Register")
	public String register(@RequestParam HashMap<String, Object> map) {
		System.out.println(map);
		companyUserService.saveUser(map);
		return "redirect:/Company/LoginForm";
	}
	
	
	@PostMapping("/Login")
	public String login(HttpServletRequest requset,
					    HttpServletRequest response ) {

		String 		  userid = requset.getParameter("company_user_id");
		String 		  passwd = requset.getParameter("company_user_passwd");
		CompanyUserVo vo     = companyUserService.login(userid,passwd);
		System.out.println(vo);
		HttpSession session = requset.getSession();
		session.setAttribute("companylogin", vo);
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
