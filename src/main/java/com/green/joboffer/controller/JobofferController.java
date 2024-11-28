package com.green.joboffer.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		
		List<HashMap<String, Object>> JobOfferRoomCompanyUserList = jobofferService.getJobOfferRoomCompanyUserList(map);
		int jobofferRoomIdx = Integer.parseInt(String.valueOf(JobOfferRoomCompanyUserList.get(0).get("JOBOFFER_ROOM_IDX")));
		map.put("joboffer_room_idx", jobofferRoomIdx);
		List<HashMap<String, Object>> JobOfferMessageList = jobofferService.getJobofferMessageList(map);
		System.out.println("JobOfferRoomComapnyUser JobOfferRoomCompanyUserList:" + JobOfferRoomCompanyUserList);
		System.out.println("JobOfferRoomComapnyUser JobOfferMessageList:" + JobOfferMessageList);
		mv.addObject("JobOfferRoomCompanyUserList", JobOfferRoomCompanyUserList);
		mv.addObject("JobOfferMessageList", JobOfferMessageList);
		mv.setViewName("/company/companyJoboffer/companyJobofferMessage");
		return mv;
		
	}
	
	@RequestMapping("/JobOfferRoomOneView")
	public ModelAndView JobOfferRoomOneView (@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		List<HashMap<String, Object>> jobofferMessageList = jobofferService.getJobofferMessageList(map); 
		mv.addObject("jobofferMessageList", jobofferMessageList);
		return mv;
		
	}
	
	@RequestMapping("/JobOfferMessages")
	public ModelAndView JobOfferMessages (HttpSession session,@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		UserVo userVo = (UserVo) session.getAttribute("userLogin");
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		int userIdx = 0;
		int companyUserIdx = 0;
		if(userVo != null) {
			userIdx = userVo.getUser_idx();
			map.put("user_idx", userIdx);
		};
		if(companyUserVo != null) {
			companyUserIdx = companyUserVo.getCompany_user_idx();
			map.put("company_user_idx", companyUserIdx);
		};
		String joboffer_room_status  =  "ACTIVE";
		
		
		return mv;
		
	}
	
	@RequestMapping("/JobofferTest")
	public ModelAndView jobofferTest () {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/users/personalJoboffer/personalJobOfferMessage");
		return mv;
		
	}
 
}
