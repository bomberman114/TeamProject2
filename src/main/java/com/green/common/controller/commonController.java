package com.green.common.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.green.common.duty.mapper.CommonDutyMapper;
import com.green.common.duty.vo.CommonDutyVo;
import com.green.company.image.mapper.CompanyImageMapper;
import com.green.company.recruit.service.CompanyRecruitService;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.region.mapper.RegionMapper;
import com.green.region.vo.RegionVo;
import com.green.skills.mapper.SkillsMapper;
import com.green.skills.stack.mapper.SkillStackMapper;
import com.green.skills.stack.vo.SkillStackVo;
import com.green.company.mapper.CompanyUserMapper;
import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.service.CompanyRecruitService;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.service.CompanyUserService;
import com.green.paging.vo.Pagination;
import com.green.paging.vo.PagingResponse;
import com.green.paging.vo.SearchVo;
import com.green.region.mapper.RegionMapper;
import com.green.region.vo.RegionVo;
import com.green.skills.mapper.SkillsMapper;
import com.green.skills.vo.SkillVo;
import com.green.user.bookmark.mapper.UsersBookmarkMapper;
import com.green.user.bookmark.vo.UserBookmarkVo;
import com.green.user.resume.mapper.UserResumeMapper;
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
	
	@Autowired
	private RegionMapper regionMapper;
	
	@Autowired
	private SkillStackMapper skillStackMapper;
	
	@Autowired
	private SkillsMapper skillsMapper;

	private CompanyUserMapper companyUserMapper;
	
	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;
	
	@Autowired
	private UserResumeMapper userResumeMapper; 
	
	@Autowired
	private CompanyImageMapper companyImageMapper;
	
	@Autowired
	private CommonDutyMapper commonDutyMapper;
	
	@Autowired
	private CompanyUserService companyUserService;

	@RequestMapping("/RecruitSearchForm")
	public ModelAndView commonRecruitSearchFrom(@RequestParam HashMap<String, Object> map) {

	List<RegionVo> regionList       = regionMapper.getRegionList();
	List<CommonDutyVo> dutyList     = commonDutyMapper.getCommonDutyList();
	List<SkillStackVo> stackList    = skillStackMapper.getSkillStackList();
	List<SkillVo> initialSkillList  = skillsMapper.getSeletedSkillStackSkillList(1);
	ModelAndView mv = new ModelAndView();

	if(map.get("search") != null) {
		String search = String.valueOf(map.get("search")); 
		mv.addObject("search", search);
	}
	
	
	mv.addObject("regionList",regionList);
	mv.addObject("dutyList",dutyList);
	mv.addObject("stackList",stackList);
	mv.addObject("initialSkillList",initialSkillList);
		
	mv.setViewName("/common/recruitSearchForm");
	return mv;
	}
	
	@RequestMapping("/FilterRecruitList")
	public ResponseEntity<HashMap<String, Object>> filterRecruitList(
	        @RequestBody HashMap<String, Object> map, HttpServletRequest request) {
	    System.out.println(map);
	    HashMap<String, Object> res = new HashMap<>();
	    
	    HttpSession session = request.getSession();
	    UserVo userVo = (UserVo) session.getAttribute("userLogin");
	    
	    if (userVo != null) {
	        List<UserBookmarkVo> bookmarkList = usersBookmarkMapper.findAllById(userVo);
	        res.put("bookmarkList", bookmarkList);
	    }

	    List<HashMap<String, Object>> fiterRecruitList = companyRecruitService.filterRecruitList(map);
	    for (HashMap<String, Object> recruit : fiterRecruitList) {
	        String companySfileName = String.valueOf(recruit.get("COMPANY_SFILE_NAME"));
	        if (companySfileName != null) {
	            companySfileName = fileNemeReplace(companySfileName);
	            recruit.put("COMPANY_SFILE_NAME", companySfileName);
	        }
	    }
	    
	    if (map.get("skillList") != null) {
	    	System.out.println("스킬 있음");
	    	
	    	String userSkillString = String.valueOf(map.get("skillList"));
	    	userSkillString = userSkillString.replace("[", "").replace("]", "").trim();
	    	List<Integer> userSkills = Arrays.stream(userSkillString.split(","))
                    .map(String::trim)
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());
	    	
	    	
	    	/*
			List<Integer> userSkills = (List<Integer>) map.get("skillList");
	    	 */
	        System.out.println("User skills: " + userSkills);
	        List<HashMap<String, Object>> skillFilterRecruitList = new ArrayList<>();
	        for (HashMap<String, Object> recruit : fiterRecruitList) {
	            String skillString = String.valueOf(recruit.get("SKILLSIDX"));
	            if (skillString != null && !skillString.equals("null")) {
	                skillString = skillString.replace("[", "").replace("]", "").trim();
	                List<Integer> recruitSkills = Arrays.stream(skillString.split(","))
	                    .map(String::trim)
	                    .map(Integer::parseInt)
	                    .collect(Collectors.toList());
	                
	                
	                Set<Integer> userSkillSet = new HashSet<>(userSkills);
	                boolean isSkillMatch = recruitSkills.stream().anyMatch(userSkillSet::contains);
	                if(isSkillMatch) {
	                	skillFilterRecruitList.add(recruit);
	                }
	                	
	                
	                /*
	                boolean isSkillMatch = false; 
	                for(int i = 0; i < userSkills.size(); i++) {
	                	for(int j = 0; j < recruitSkills.size(); j++) {
	                		System.out.println(userSkills.get(i) instanceof Integer);
	                		System.out.println(recruitSkills.get(j) instanceof Integer);
	                		if (userSkills.get(i) instanceof Integer && recruitSkills.get(j) instanceof Integer) {
	                		    if (((Integer)userSkills.get(i)).equals((Integer)recruitSkills.get(j))) {
	                		        // 일치하는 경우의 로직
	                		    }
	                		}
	                		if(userSkills.get(i).equals(recruitSkills.get(j))) {
	                		    System.out.println("일치여부");
	                		    isSkillMatch = true;
	                		}
	                	}
	                		
	                }*/
	            }
	        }
	        res.put("fiterRecruitList", skillFilterRecruitList);
	    } else {
	        res.put("fiterRecruitList", fiterRecruitList);
	    }
	    
	    return ResponseEntity.ok(res);
	}

	public String fileNemeReplace(String fileName) {	
		fileName = fileName.replace("\\", "/");
		String path = "/img/commonImage/";
		fileName = path + fileName;
		return fileName;
	}
	
	@RequestMapping("/RecruitOneView")
	public ModelAndView  commonRecruitOneView(CompanyRecruitVo vo, HttpServletRequest request) {
		
		companyRecruitService.updateViews(vo);
		
		HashMap<String, Object> map = companyRecruitService.getcompanyRecruitMap(vo);
        String skillString          = String.valueOf(map.get("SKILL_NAME"));
        
        if(skillString == "null") {skillString = "";}
        
        String[] resumeSkillArr = skillString.split(",");
		// 배열을 List로 변환하여 저장
        map.put("SKILLS", Arrays.asList(resumeSkillArr));
        HashMap<String, Object> companyHistory = companyRecruitService.getCompanyHistory(vo.getCompany_recruit_idx());
        HashMap<String, Object> companyImage   = companyImageMapper.findById(vo);
        
        
        ModelAndView mv = new ModelAndView();
        
        if(companyImage != null) {
        	String imageSrc = fileNemeReplace(String.valueOf(companyImage.get("COMPANY_SFILE_NAME")));
        	companyImage.put("COMPANY_SFILE_NAME", imageSrc);
        	mv.addObject("companyImage",companyImage);
        	
        }
        
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
	
	@RequestMapping("/SearchCompanyRecruiteList")
	public ModelAndView searchCompanyRecruiteList (HttpServletRequest request,
			@RequestParam(value = "nowpage", required = false) Integer nowpage,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		String condition = "CR.COMPANY_RECRUIT_REGDATE";
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
		map.put("condition", condition);
		map.put("nowpage", nowpage);
		map.put("pageSize", pageSize);
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
		
		int count = 0;
		//resumesCount = userResumeMapper.getUserResumeCount();
		
		map.put("recruit_title", "");
		map.put("checkedSkillListToTypeString", checkedSkillListToTypeString);
		map.put("checkedRegionList", checkedRegionList);
		map.put("checkedCommonDutyList", checkedCommonDutyList);
		count = companyRecruitMapper.getSearchCompanyRecruitCountWithConditions(map);
		 
	      PagingResponse<HashMap<String, String>> response = null;
	       if( count < 1 ) {   // 현재 Menu_id 조회한 자료가 없다면
	          response = new PagingResponse<>(
	             Collections.emptyList(), null);
	          // Collections.emptyList() : 자료는 없는 빈 리스트를 채운다
	       }
	       
	      SearchVo  searchVo = new SearchVo();
	      searchVo.setPage(nowpage);   // 현재 페이지 정보
	      searchVo.setRecordSize(pageSize);   // 페이지당 10개
	      searchVo.setPageSize(10);    // paging.jsp 에 출력할 페이지번호수  
	      
	      Pagination  pagination = new Pagination(count, searchVo);
	      searchVo.setPagination(pagination);
	      
	       int      startRow      =  searchVo.getOffset();
	       int      endRow        =  searchVo.getRecordSize();
	       
	       map.put("startRow", startRow);
	       map.put("endRow", endRow);
		
	       List<HashMap<String, Object>> searchCompanyRecruitList =  
	               companyRecruitService.getSearchCompanyRecruitList (map);
	            		
		
		
	       mv.setViewName("/common/recruitSearchForm");
		return mv;
		
	}
}
