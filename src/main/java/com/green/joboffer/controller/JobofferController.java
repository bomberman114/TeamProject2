package com.green.joboffer.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.company.vo.CompanyUserVo;
import com.green.joboffer.message.mapper.JobofferMessageMapper;
import com.green.joboffer.message.vo.JobofferMessageVo;
import com.green.joboffer.rooms.mapper.JobofferRoomMapper;
import com.green.joboffer.service.JobofferService;
import com.green.users.vo.UserVo;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Joboffer")
public class JobofferController {
	
	@Autowired
	private JobofferService jobofferService;
	
	@Autowired
	private JobofferRoomMapper jobofferRoomMapper;
	
	@Autowired
	private JobofferMessageMapper jobofferMessageMapper;
	
	
	@RequestMapping("/JobOfferRoomCreate")
	public ModelAndView JobOfferRoomCreate (@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		System.out.println("JobOfferRoomCreate map :" + map); // JobOfferRoomCreate map :{company_recruit_idx=34}
		
		jobofferRoomMapper.setJobOfferRoomCreate(map);
		int jobofferRoomIdx = jobofferRoomMapper.getJobofferRoomIdx(map);
		System.out.println("JobOfferRoomCreate  jobofferRoomIdx:" + jobofferRoomIdx);
		map.put("joboffer_room_idx", jobofferRoomIdx);
		jobofferMessageMapper.setMessageFrist(map);
		mv.setViewName("redirect:/Joboffer/JobOfferRoomComapnyUser");
		return mv;
	} 
	
	
	@RequestMapping("/JobOfferRoomComapnyUser")
	public ModelAndView JobOfferRoom (HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		HashMap<String, Object> map = new HashMap<>();
		int companyUserIdx = 0;
			companyUserIdx = companyUserVo.getCompany_user_idx();
			map.put("company_user_idx", companyUserIdx);
		
		//String JOBOFFER_ROOM_USER_STATUS  =  "ACTIVE";
		String JOBOFFER_ROOM_COMPANY_USER_STATUS  =  "ACTIVE";
		//map.put("joboffer_room_user_status", JOBOFFER_ROOM_USER_STATUS);
		map.put("joboffer_room_company_user_status", JOBOFFER_ROOM_COMPANY_USER_STATUS);
		int count = jobofferRoomMapper.getJobOfferRoomActiveListCount(map);
		List<HashMap<String, Object>> jobOfferRoomActiveUserList = null;
		List<HashMap<String, Object>> jobOfferMessageList = null;
		int jobofferRoomIdx = 0;
		
		if(count != 0) {
			jobOfferRoomActiveUserList = jobofferService.getJobOfferRoomActiveList(map);
			System.out.println("jobOfferRoomUserList:" + jobOfferRoomActiveUserList);
			System.out.println("map:" + map);
			jobofferRoomIdx = Integer.parseInt(String.valueOf(jobOfferRoomActiveUserList.get(0).get("JOBOFFER_ROOM_IDX")));
			map.put("joboffer_room_idx", jobofferRoomIdx);
			jobOfferMessageList = jobofferService.getJobofferMessageList(map);
			System.out.println("JobOfferRoomComapnyUser JobOfferRoomCompanyUserList:" + jobOfferRoomActiveUserList);
			System.out.println("JobOfferRoomComapnyUser JobOfferMessageList:" + jobOfferMessageList);
			
		};
		
		mv.addObject("jobofferRoomIdx", jobofferRoomIdx);
		mv.addObject("jobOfferRoomCompanyUserList", jobOfferRoomActiveUserList);
		mv.addObject("jobOfferMessageList", jobOfferMessageList);
		mv.setViewName("/company/companyJoboffer/companyJobofferMessage");
		return mv;
		
	}
	
	@RequestMapping("/JobOfferRoomOneView")
	public ModelAndView JobOfferRoomOneView (HttpSession session,@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		UserVo userVo = (UserVo) session.getAttribute("userLogin");
		System.out.println("map:" + map);
		String JOBOFFER_ROOM_COMPANY_USER_STATUS = null;
		String JOBOFFER_ROOM_USER_STATUS = null;
		if(companyUserVo != null) {
			 JOBOFFER_ROOM_COMPANY_USER_STATUS  =  "ACTIVE";
		};
		if(userVo != null) {
			JOBOFFER_ROOM_USER_STATUS  =  "ACTIVE";
		};
		map.put("joboffer_room_company_user_status", JOBOFFER_ROOM_COMPANY_USER_STATUS);
		map.put("joboffer_room_user_status", JOBOFFER_ROOM_USER_STATUS);
		List<HashMap<String, Object>> jobOfferRoomCompanyUserList = jobofferService.getJobOfferRoomActiveList(map);
		List<HashMap<String, Object>> jobOfferMessageList = jobofferService.getJobofferMessageList(map); 
		int jobofferRoomIdx = Integer.parseInt(String.valueOf(map.get("joboffer_room_idx")));
		System.out.println("jobOfferMessageList:" + jobOfferMessageList);
		System.out.println("jobOfferRoomCompanyUserList:" + jobOfferRoomCompanyUserList);
		mv.addObject("jobofferRoomIdx", jobofferRoomIdx);
		mv.addObject("jobOfferRoomCompanyUserList", jobOfferRoomCompanyUserList);
		mv.addObject("jobOfferMessageList", jobOfferMessageList);
		if(userVo != null) {
			mv.setViewName("/users/personalJoboffer/personalJobOfferMessage");
		};
		if(companyUserVo != null) {
			mv.setViewName("/company/companyJoboffer/companyJobofferMessage");
		};
		
		return mv;
		
	}
	
	@RequestMapping("/JobOfferCompanyUserMessages")
	public String JobOfferMessages (HttpSession session,@RequestParam HashMap<String, Object> map
			,RedirectAttributes redirectAttributes
			) {
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		int companyUserIdx = 0;
			companyUserIdx = companyUserVo.getCompany_user_idx();
			map.put("company_user_idx", companyUserIdx);
		String JOBOFFER_ROOM_COMPANY_USER_STATUS  =  "ACTIVE";
		System.out.println("JobOfferCompanyUserMessages  map: " + map);
		jobofferMessageMapper.setMessage(map);  // JOB_OFFER_ROOM_IDX
		
		redirectAttributes.addAllAttributes(map);
		return "redirect:/Joboffer/JobOfferRoomOneView";
		
	}
	
	@RequestMapping("/JobofferRoomUser")
	public ModelAndView jobofferRoomUser (HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserVo userVo = (UserVo) session.getAttribute("userLogin");
		HashMap<String, Object> map = new HashMap<>();
		int userIdx = 0;
			userIdx = userVo.getUser_idx();
			map.put("user_idx", userIdx);
		
		//String JOBOFFER_ROOM_USER_STATUS  =  "ACTIVE";
		String JOBOFFER_ROOM_USER_STATUS  =  "ACTIVE";
		map.put("joboffer_room_user_status", JOBOFFER_ROOM_USER_STATUS);
		int count = jobofferRoomMapper.getJobOfferRoomActiveListCount(map);
		List<HashMap<String, Object>> jobOfferRoomUserList = null;
		List<HashMap<String, Object>> jobOfferMessageList = null;
		int jobofferRoomIdx = 0;
		
		if(count != 0) {
			jobOfferRoomUserList = jobofferService.getJobOfferRoomActiveList(map);
			System.out.println("jobOfferRoomUserList:" + jobOfferRoomUserList);
			System.out.println("map:" + map);
			jobofferRoomIdx = Integer.parseInt(String.valueOf(jobOfferRoomUserList.get(0).get("JOBOFFER_ROOM_IDX")));
			map.put("joboffer_room_idx", jobofferRoomIdx);
			jobOfferMessageList = jobofferService.getJobofferMessageList(map);
			System.out.println("JobOfferRoomComapnyUser JobOfferRoomCompanyUserList:" + jobOfferRoomUserList);
			System.out.println("JobOfferRoomComapnyUser JobOfferMessageList:" + jobOfferMessageList);
			
		};
		
		mv.addObject("jobofferRoomIdx", jobofferRoomIdx);
		mv.addObject("jobOfferRoomUserList", jobOfferRoomUserList);
		mv.addObject("jobOfferMessageList", jobOfferMessageList);
		mv.setViewName("/users/personalJoboffer/personalJobOfferMessage");
		return mv;
		
	}
	
	@RequestMapping("/JobOfferUserMessages")
	public String jobOfferUserMessages(HttpSession session,@RequestParam HashMap<String, Object> map
			,RedirectAttributes redirectAttributes
			) {
		UserVo userVo = (UserVo) session.getAttribute("userLogin");
		int userIdx = 0;
		userIdx = userVo.getUser_idx();
		map.put("user_idx", userIdx);
		//String JOBOFFER_ROOM_COMPANY_USER_STATUS  =  "ACTIVE";
		System.out.println("JobOfferCompanyUserMessages  map: " + map);
		jobofferMessageMapper.setMessage(map);  // JOB_OFFER_ROOM_IDX
		
		redirectAttributes.addAllAttributes(map);
		
		return "redirect:/Joboffer/JobOfferRoomOneView";
	}
	
 
}
