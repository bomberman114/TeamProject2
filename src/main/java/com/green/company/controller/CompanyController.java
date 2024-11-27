package com.green.company.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.green.common.duty.mapper.CommonDutyMapper;
import com.green.common.duty.vo.CommonDutyVo;
import com.green.company.image.mapper.CompanyImageMapper;
import com.green.company.mapper.CompanyUserMapper;
import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.service.CompanyUserService;
import com.green.company.vo.CompanyUserVo;
import com.green.paging.vo.Pagination;
import com.green.paging.vo.PagingResponse;
import com.green.paging.vo.SearchVo;
import com.green.region.mapper.RegionMapper;
import com.green.region.vo.RegionVo;
import com.green.skills.mapper.SkillsMapper;
import com.green.skills.vo.SkillVo;
import com.green.user.resume.mapper.UserResumeMapper;
import com.green.users.resume.service.UsersResumeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Company")
public class CompanyController {
	
	@Autowired
	private CompanyUserMapper companyUserMapper;
	
	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;
	
	@Autowired
	private UserResumeMapper userResumeMapper; 
	
	@Autowired
	private UsersResumeService usersResumeService;
	
	@Autowired
	private CompanyImageMapper companyImageMapper;
	
	@Autowired
	private SkillsMapper skillsMapper;
	
	@Autowired
	private RegionMapper regionMapper;
	
	@Autowired
	private CommonDutyMapper commonDutyMapper;
	
	@Autowired
	private CompanyUserService companyUserService;
	

	

	@RequestMapping("/CompanyMypage")
    public ModelAndView companyMypage (HttpSession session) {
        CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
        HashMap<String, Object> map = new HashMap<>();
        ModelAndView mv = new ModelAndView();
        int company_user_idx = companyUserVo.getCompany_user_idx();
        map.put("company_user_idx", company_user_idx);
        HashMap<String, Object> companyMap = companyUserService.getCompanyUserData(companyUserVo);
        HashMap<String, Integer> applicationStatusIdx = companyUserMapper.getCompanyApplicationStatusIdxMap(map);
        //System.out.println("applicationStatusIdx:" + applicationStatusIdx);
        //System.out.println("companyMapController:" + companyMap);
     
        mv.addObject("applicationStatusIdx", applicationStatusIdx);
        mv.addObject("companyMap", companyMap);
        mv.setViewName("/company/companyUsers/companyMyPage");
        
        return mv;
    }
	
	@RequestMapping("/CompanyMypageUpdateForm")
	public ModelAndView companyMypageUpdateForm (HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		HashMap<String, Object> companyUserProfile = companyUserService.getCompanyUserProfile(companyUserVo);
		System.out.println("companyUserProfile:" + companyUserProfile);
		 mv.addObject("companyUserVo", companyUserVo);
		 mv.addObject("companyUserProfile", companyUserProfile);
	     mv.setViewName("/company/companyUsers/companyMypageUpdateForm");
		return mv;
	}
	
	
	@RequestMapping("/MypageProfileUpdate")
	public ModelAndView MypageProfile(HttpSession session,
									  @RequestParam HashMap<String, Object> map ,
									  @RequestParam(value="profileImge")  MultipartFile[]   profileImge) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		map.put("companyUserVo", companyUserVo);
		companyUserService.deleteProfileImge(map);
		companyUserService.setProfileUpdate(map, profileImge);
		companyUserVo = companyUserMapper.getCompanyUser(companyUserVo);
		
		//session.invalidate();
		session.setAttribute("companylogin", companyUserVo);
		
		
		mv.setViewName("redirect:/Company/CompanyMypage");
		return mv;
		
	}
	
	@RequestMapping("/SearchResumes")
	public ModelAndView searchResumes(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "nowpage", required = false) Integer nowpage,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			@RequestParam HashMap<String, Object> map
			) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		//System.out.println("map:" + map);
		String condition = "UR.USER_RESUME_REGDATE";
		String conditionMap = String.valueOf(map.get("condition"));
		//System.out.println(conditionMap);
		if(conditionMap.equals("")) {
			condition = conditionMap;
		};
		
		if(conditionMap != null ) {
			condition = conditionMap;
		};
		if (nowpage == null ) {
			nowpage = 0;
		}
		if( pageSize == null) {
			pageSize = 9;
		};
		
		List<SkillVo> skillList = skillsMapper.getSkillList();
		List<RegionVo> regionList = regionMapper.getRegionList();
		List<CommonDutyVo> commonDutyList =  commonDutyMapper.getCommonDutyList();

		Map<String, String[]> requestMap = request.getParameterMap();
		String[] skills = requestMap.get("skill_idx");
		String[] regions = requestMap.get("region_idx");
		String[] commonDutys = requestMap.get("common_duty_idx");
		List<SkillVo> checkedSkillList = new ArrayList<>();
		List<RegionVo> checkedRegionList = new ArrayList<>();
		List<CommonDutyVo> checkedCommonDutyList = new ArrayList<>();
		List<String> checkedSkillListToTypeString = new ArrayList<>();
	     for(int i =0; i < checkedSkillList.size(); i++) {
	    	 checkedSkillListToTypeString.add(skills[i]);
	     };
		if (skills != null) {
			for (int i = 0; i < skills.length; i++) {
				SkillVo skillVo = new SkillVo();
				skillVo.setSkill_idx(Integer.parseInt(skills[i]));
				checkedSkillList.add(skillVo);
				checkedSkillListToTypeString.add(skills[i]);
			};
			checkedSkillList = skillsMapper.getCheckedSkillList(checkedSkillList);
		};
		if (regions != null) {

			for (int i = 0; i < regions.length; i++) {
				RegionVo regionVo = new RegionVo();
				regionVo.setRegion_idx(Integer.parseInt(regions[i]));
				checkedRegionList.add(regionVo);
			};
			checkedRegionList = regionMapper.getCheckedRegionList(checkedRegionList);

		};
		if (commonDutys != null) {
			
			for (int i = 0; i < commonDutys.length; i++) {
				CommonDutyVo commonDutyVo = new CommonDutyVo();
				commonDutyVo.setCommon_duty_idx(Integer.parseInt(commonDutys[i]));
				checkedCommonDutyList.add(commonDutyVo);
			};
			checkedCommonDutyList = commonDutyMapper.getCheckedCommonDutyList(checkedCommonDutyList);
			
		};
		if (skills == null) {
			checkedSkillList = null;
			checkedSkillListToTypeString = null;
			
		};
		if (regions == null) {
			checkedRegionList = null;

		};
		if (commonDutys == null) {
			checkedCommonDutyList = null;
			
		};
		int resumesCount = 0;
		//resumesCount = userResumeMapper.getUserResumeCount();
		resumesCount = userResumeMapper.getCheckedUserResumeCountWithConditions( 
				checkedSkillListToTypeString
                , checkedRegionList
                , checkedCommonDutyList);
		 
	      PagingResponse<HashMap<String, String>> response = null;
	       if( resumesCount < 1 ) {   // 현재 Menu_id 조회한 자료가 없다면
	          response = new PagingResponse<>(
	             Collections.emptyList(), null);
	          // Collections.emptyList() : 자료는 없는 빈 리스트를 채운다
	       }
	       
	      SearchVo  searchVo = new SearchVo();
	      searchVo.setPage(nowpage);   // 현재 페이지 정보
	      searchVo.setRecordSize(pageSize);   // 페이지당 10개
	      searchVo.setPageSize(10);    // paging.jsp 에 출력할 페이지번호수  
	      
	      Pagination  pagination = new Pagination(resumesCount, searchVo);
	      searchVo.setPagination(pagination);
	      
	       int      startRow      =  searchVo.getOffset();
	       int      endRow        =  searchVo.getRecordSize();
	       
	     //System.out.println("checkedSkillListToTypeString:"+checkedSkillListToTypeString);
	       System.out.println("searchVo:"+searchVo);
	       List<HashMap<String, Object>> userResumeList =  
	               usersResumeService.getUserResumeList(   
	            		   							  checkedSkillListToTypeString
	                                                , checkedRegionList
	                                                , checkedCommonDutyList
	                                                , startRow
	                                                , endRow
	                                                , condition
	            		   );
	       System.out.println("userResumeList:" + userResumeList);
	       //System.out.println("checkedSkillList:"+checkedSkillList);
	       mv.addObject("condition", condition);
	       mv.addObject("commonDutyList", commonDutyList);
	       mv.addObject("pagination", pagination);
	       mv.addObject("regionList", regionList);
	       mv.addObject("skillList", skillList);
	       mv.addObject("checkedCommonDutyList", checkedCommonDutyList);
	       mv.addObject("checkedRegionList", checkedRegionList);
	       mv.addObject("checkedSkillList", checkedSkillList);
	       mv.addObject("nowpage", nowpage);
	       mv.addObject("pageSize", pageSize);
	       mv.addObject("endRow", endRow);
	       mv.addObject("userResumeList", userResumeList);
	       mv.setViewName("/company/companyJoboffer/companySearchUserResumeList");
	       
		return mv;

	}
	@RequestMapping("/CompanySearchUserResumeOneView")
	public ModelAndView companySearchUserResumeOneView (@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		System.out.println(map);
		
		HashMap<String, Object> userResumeMap = usersResumeService.getuserResumeMap(map);
		
		
		mv.addObject("vo",userResumeMap);
		mv.setViewName("/company/companyJoboffer/CompanySearchUserResumeOneView");
		return mv;
		
	}
	

	
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
		 LocalDate companyEstablishFormat = LocalDate.parse(vo.getCompany_establish().substring(0, 10),
					DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		 vo.setCompany_establish(String.valueOf(companyEstablishFormat));
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
