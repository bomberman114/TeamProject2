package com.green.company.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.image.mapper.CompanyImageMapper;
import com.green.company.mapper.CompanyUserMapper;
import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
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
	private CompanyImageMapper companyImageMapper;
	
	@Autowired
	private SkillsMapper skillsMapper;
	
	@Autowired
	private RegionMapper regionMapper;
	
	@Autowired
	private CompanyUserService companyUserService;
	
	

	@RequestMapping("/CompanyMypage")
    public ModelAndView companyMypage (HttpSession session) {
        CompanyUserVo companyUserLogin = (CompanyUserVo) session.getAttribute("companyUserLogin");
        ModelAndView mv = new ModelAndView();
       //String company_id = companyUserLogin.getCompany_user_id();
        
      //CompanyUserVo companyUserVo = companyUserMapper.getInfoUser(companyUserLogin.getCompany_user_id());
      //  mv.addObject("companyUserVo", companyUserVo);
        mv.setViewName("/company/companyMypage/companyMypage");
        
        return mv;
    }
	
	@RequestMapping("/Mypage")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("CompanyUserLogin");
		HashMap<String, Object> companyMap = companyUserService.getCompanyUserData(companyUserVo);
		
		mv.addObject("companyMap", companyMap);
		mv.setViewName("/");
		return mv;
		
	}
	
	@RequestMapping("/MypageProfileUpdate")
	public ModelAndView MypageProfile(@RequestParam HashMap<String, Object> map ,
									  @RequestParam(value="profileImge")  MultipartFile[]   profileImge) {
		ModelAndView mv = new ModelAndView();
		companyUserService.deleteProfileImge(map);
		companyUserService.setProfileUpdate(map, profileImge);
		
		mv.setViewName("redirect:/");
		return mv;
		
	}
	
	@RequestMapping("/searchResumes")
	public ModelAndView searchResumes(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "nowpage", required = false) Integer nowpage,
			@RequestParam(value = "pageSize", required = false) Integer pageSize) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("CompanyUserLogin");
		
		if (nowpage == null && pageSize == null) {
			nowpage = 1;
			pageSize = 10;
		};
		
		List<SkillVo> skillList = skillsMapper.getSkillList();
		List<RegionVo> regionList = regionMapper.getRegionList();

		Map<String, String[]> map = request.getParameterMap();
		String[] skills = map.get("skill_idx");
		String[] regions = map.get("region_idx");
		List<SkillVo> checkedSkillList = new ArrayList<>();
		List<RegionVo> checkedRegionList = new ArrayList<>();
		if (skills != null) {
			for (int i = 0; i < skills.length; i++) {
				SkillVo skillVo = new SkillVo();
				skillVo.setSkill_idx(Integer.parseInt(skills[i]));
				checkedSkillList.add(skillVo);
			};
		};
		if (regions != null) {

			for (int i = 0; i < regions.length; i++) {
				RegionVo regionVo = new RegionVo();
				regionVo.setRegion_idx(Integer.parseInt(regions[i]));
				checkedRegionList.add(regionVo);
			};

		};
		if (skills == null) {
			checkedSkillList = null;
		};
		if (regions == null) {
			checkedRegionList = null;

		};
		int resumesCount = 0;
		resumesCount = userResumeMapper.getUserResumeCount();
		 
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
	       
	       List<HashMap<String, Object>> userResumeList =  
	               userResumeMapper.getUserResumeList(   
	                                                  checkedSkillList
	                                                , checkedRegionList
	                                                , startRow
	                                                , endRow );
	       
	       mv.addObject("regionList", regionList);
	       mv.addObject("skillList", skillList);
	       mv.addObject("checkedRegionList", checkedRegionList);
	       mv.addObject("checkedSkillList", checkedSkillList);
	       mv.addObject("nowpage", nowpage);
	       mv.addObject("pageSize", pageSize);
	       mv.addObject("endRow", endRow);
	       mv.addObject("userResumeList", userResumeList);
	       mv.setViewName("/company/");
	       
		return mv;

	}

}
