package com.green.users.controller;

import java.util.HashMap;
import java.util.List;
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

import com.green.application.mapper.ApplicationMapper;
import com.green.application.vo.AppllicationVo;
import com.green.user.bookmark.mapper.UsersBookmarkMapper;
import com.green.user.bookmark.vo.UserBookmarkVo;
import com.green.users.resume.service.UsersResumeService;
import com.green.users.service.UsersService;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users")
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private UsersResumeService usersResumeService;
	
	@Autowired
	private ApplicationMapper applicationMapper;
	
	@Autowired
	private UsersBookmarkMapper usersBookmarkMapper;

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
	
	
	@RequestMapping("/MyPage/Bookmark/List")
	public ModelAndView personalUserApply(HttpServletRequest request) {
		
		
		HttpSession                   session      = request.getSession();
		UserVo                        vo           = (UserVo) session.getAttribute("userLogin");
		List<HashMap<String, Object>> bookmarkList = usersBookmarkMapper.markUpRecruitList(vo.getUser_idx());
		int                           markupCount  = usersBookmarkMapper.countById(vo.getUser_idx());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("bookmarkList",bookmarkList);
		mv.addObject("markupCount",markupCount);
		mv.setViewName("/users/bookmark/personalUserbookmarkList");
		return mv;
	}
	
	
	@RequestMapping("/RecruitMarkUp")
	public ResponseEntity<HashMap<String,UserBookmarkVo>> recruitMarkUp(
			@RequestBody Map<String,String> map
			) {
		String userId    = map.get("userIdx");
		String recruitId = map.get("recruitIdx"); 
		UserBookmarkVo vo = usersBookmarkMapper.findById(userId,recruitId);
		if(vo != null) {
			int bookmarkCheck = vo.getBookmark_check();
			vo.setBookmark_check(bookmarkCheck == 1 ? 0 : 1);
			usersBookmarkMapper.updateBookMark(vo);
			vo = usersBookmarkMapper.findById(userId,recruitId);
		}else {
			usersBookmarkMapper.saveBookMark(userId,recruitId);
			vo = usersBookmarkMapper.findById(userId,recruitId);
		}
		HashMap<String,UserBookmarkVo> res = new HashMap<>();
		res.put("bookmark", vo);
		return ResponseEntity.ok(res);
	}
	
	@RequestMapping("/Apply")
	public ResponseEntity<HashMap<String, Object>> userApply(
			@RequestBody Map<String,String> map
			) {
		AppllicationVo vo = applicationMapper.findById(map);
		System.out.println(vo);
		HashMap<String,Object> res = new HashMap<>();
		if(vo == null) {
			usersService.userApplySubmit(map);
			res.put("result", "입사지원이 완료되었습니다.");			
		}else {
			res.put("result", "지원한 이력이 있습니다.");			
		}
		System.out.println(res);
		return ResponseEntity.ok(res);
	}
	
	
	@RequestMapping("/MyPage/Apply/List")
	public ModelAndView personalUserApplyList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVo      vo      = (UserVo) session.getAttribute("userLogin");
		
		List<HashMap<String, Object>> resumeList = usersResumeService.findResumeAll(vo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("resumeList",resumeList);
		mv.setViewName("/users/apply/personalUserApplyList");
		return mv;
	}
	
	@RequestMapping("/GetApplyList")
	public ResponseEntity<HashMap<String,Object>> getApplyList(
			@RequestBody Map<String,String> map
			) {
		System.out.println(map);
		HashMap<String, Object> userApplyCountList = usersService.findApplyCountListById(map); 
		List<HashMap<String, Object>> userApplyList = usersService.findApplyList(map);
		HashMap<String,Object> res = new HashMap<>();
		res.put("userApplyList", userApplyList);
		res.put("userApplyCountList", userApplyCountList);
		return ResponseEntity.ok(res);
	}
	
	@RequestMapping("/ApplyCancle")
	public ResponseEntity<HashMap<String,Object>> userApplyCancle(
			@RequestBody Map<String,String> map
			) {
		System.out.println(map);
		applicationMapper.deleteUserApply(map);
		
		HashMap<String,Object> res = new HashMap<>();
		res.put("result","지원취소 되었습니다.");
		return ResponseEntity.ok(res);
	}
	
}
