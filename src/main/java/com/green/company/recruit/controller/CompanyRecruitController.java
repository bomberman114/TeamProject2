package com.green.company.recruit.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.common.company.recruit.skill.mapper.CommonCompanyRecruitSkillMapper;
import com.green.common.duty.mapper.CommonDutyMapper;
import com.green.common.duty.vo.CommonDutyVo;
import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.service.CompanyRecruitService;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.vo.CompanyUserVo;
import com.green.education.status.mapper.EducationStatusMapper;
import com.green.education.status.vo.EducationStatusVo;
import com.green.region.mapper.RegionMapper;
import com.green.region.vo.RegionVo;
import com.green.skills.mapper.SkillsMapper;
import com.green.skills.stack.mapper.SkillStackMapper;
import com.green.skills.stack.vo.SkillStackVo;
import com.green.skills.vo.SkillVo;
import com.green.user.resume.mapper.UserResumeMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/CompanyRecruit")
public class CompanyRecruitController {

	@Autowired
	private CommonCompanyRecruitSkillMapper commonCompanyRecruitSkillMapper;
	
	@Autowired
	private CompanyRecruitService companyRecruitService;

	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;

	@Autowired
	private UserResumeMapper userResumeMapper;

	@Autowired
	private SkillsMapper skillsMapper;

	@Autowired
	private SkillStackMapper skillStackMapper;

	@Autowired
	private RegionMapper regionMapper;

	@Autowired
	private CommonDutyMapper commonDutyMapper;
	
	@Autowired
	private EducationStatusMapper educationStatusMapper;
	
	@RequestMapping("/Test")
	public ModelAndView test (@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		System.out.println("Test:" + map); //Test:{test=<a href="/"><div>asddasd</div></a>}
		/*
		<form action="/CompanyRecruit/Test" method="get">
		<textarea name="test" rows="" cols=""><a href="/"><div>asddasd</div></a></textarea>
		<input type="submit" value="GO">
		</form>
		<form action="/CompanyRecruit/Test" method="get">
		<textarea name="test" rows="" cols=""><a href="/">
		<div>asddasd</div><div>dasdad</div>
		</a></textarea>
		<input type="submit" value="GO">
		</form>
		
		Test:{test=<a href="/">
		<div>asddasd</div><div>dasdad</div>
		</a>}

		
		*/
		return mv;
		
	}
	
	@RequestMapping("/RecruitListAjax")
	@ResponseBody
	public List<HashMap<String, Object>> recruitListAjax (HttpSession session){
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		List<HashMap<String, Object>> companyRecruitList = companyRecruitService.getCompanyRecruiteList(companyUserVo);
		System.out.println("RecruitListAjax:" + companyRecruitList);
		return companyRecruitList;
	}
	
	// 회사가 자기들 채용공고 보기
	@RequestMapping("/RecruitList")
	public ModelAndView recruitList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		// List<HashMap<String, Object>> companyRecruitList =
		// companyRecruitMapper.getCompanyRecruiteList(companyUserVo);
		List<HashMap<String, Object>> companyRecruitList = companyRecruitService.getCompanyRecruiteList(companyUserVo);
		//System.out.println("companyRecruitList:" + companyRecruitList);
		mv.addObject("companyRecruitList", companyRecruitList);
		mv.setViewName("/company/recruit/companyRecruitList");
		return mv;

	}

	// 데드라이 지난 공고보기
	@RequestMapping("/DeadRecruittList")
	public ModelAndView recruittListDeadline(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");

		List<HashMap<String, Object>> companyRecruitDeadList = companyRecruitService
				.getCompanyRecruiteDeadList(companyUserVo);
		
		mv.addObject("companyRecruitDeadList", companyRecruitDeadList);
		mv.setViewName("/company/recruit/companyDeadRecruitList");
		return mv;

	}

	@RequestMapping("/ReceivedResumes")
	public ModelAndView receivedResumes() {
		ModelAndView mv = new ModelAndView();

		return mv;

	}

	@RequestMapping("/RecruitWriteForm")
	public ModelAndView recruitWriteForm(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		   LocalDate companyEstablishFormat = LocalDate.parse(companyUserVo.getCompany_establish().substring(0, 10),
					DateTimeFormatter.ofPattern("yyyy-MM-dd"));
           
		companyUserVo.setCompany_establish(String.valueOf(companyEstablishFormat));
		List<SkillVo> skillList = skillsMapper.getSkillList();
		List<RegionVo> regionList = regionMapper.getRegionList();
		List<CommonDutyVo> commonDutyList = commonDutyMapper.getCommonDutyList();
		List<SkillStackVo> skillStackList = skillStackMapper.getSkillStackList();
		List<EducationStatusVo> educationStatuList =  educationStatusMapper.getEducationStatuList();
		//System.out.println("companyUserVo:" + companyUserVo);
		
		mv.addObject("companyUserVo", companyUserVo);
		mv.addObject("educationStatuList", educationStatuList);
		mv.addObject("skillStackList", skillStackList);
		mv.addObject("commonDutyList", commonDutyList);
		mv.addObject("skillList", skillList);
		mv.addObject("regionList", regionList);
		mv.setViewName("/company/recruit/companyRecruitWriteForm");
		return mv;
	}
	
	@RequestMapping("/SeletedSkillStackSkillList")
	@ResponseBody
	public List<SkillVo> seletedSkillStackSkillList(@RequestParam(name = "skill_stack_idx") Integer skill_stack_idx) {
		List<SkillVo> skillList = skillsMapper.getSeletedSkillStackSkillList(skill_stack_idx);
		return skillList;
	}
	
	@RequestMapping("/RecruitWrite")
	public ModelAndView recruitWrite(HttpSession session, HttpServletRequest request,
			@RequestParam HashMap<String, Object> map, CompanyRecruitVo companyRecruitVo) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		
		companyRecruitMapper.setCompanyRecruitInsert(map);
		int company_recruit_idx = companyRecruitMapper.getCompanyRecruitIdx(companyUserVo);
		
		 Map<String, String[]> requestMap = request.getParameterMap();
		String[] skills = requestMap.get("skill_idx");
		List<SkillVo> checkedSkillList = new ArrayList<>();
		if (skills != null) {
			for (int i = 0; i < skills.length; i++) {
				SkillVo skillVo = new SkillVo();
				skillVo.setSkill_idx(Integer.parseInt(skills[i]));
				checkedSkillList.add(skillVo);
			};
			commonCompanyRecruitSkillMapper.setCommonCompanyRecruitSkill(company_recruit_idx ,checkedSkillList);
		};
		if (skills == null) {
			checkedSkillList = null;
		};
		//System.out.println(map);
		//System.out.println(checkedSkillList);
		 
		//companyRecruitMapper.setCompanyRecruitInsert(companyRecruitVo);
		//System.out.println("company_recruit_idx:" + company_recruit_idx);
		
		mv.setViewName("redirect:/CompanyRecruit/RecruitList");
		return mv;
	}
	
	@RequestMapping("/CompanyRecruitUpdateForm")
	public ModelAndView companyRecruitUpdateForm(HttpSession session, CompanyRecruitVo companyRecruitVo) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		HashMap<String, Object> companyRecruitMap = companyRecruitMapper.getCompanyRecruiteMap(companyRecruitVo);
		String companyEstablish = String.valueOf(companyRecruitMap.get("COMPANY_ESTABLISH"));
		String applicationDeadline = String.valueOf(companyRecruitMap.get("APPLICATION_DEADLINE"));
		LocalDate companyEstablishFormat = LocalDate.parse(companyEstablish.substring(0, 10),
					DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate applicationDeadlineFormat = LocalDate.parse(applicationDeadline.substring(0, 10),
				DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		 
		companyRecruitMap.put("COMPANY_ESTABLISH", companyEstablishFormat);
		companyRecruitMap.put("APPLICATION_DEADLINE", applicationDeadlineFormat);
		List<SkillVo> skillList = skillsMapper.getSkillList();
		List<RegionVo> regionList = regionMapper.getRegionList();
		List<CommonDutyVo> commonDutyList = commonDutyMapper.getCommonDutyList();
		List<SkillStackVo> skillStackList = skillStackMapper.getSkillStackList();
		List<EducationStatusVo> educationStatuList =  educationStatusMapper.getEducationStatuList();
		//System.out.println("companyRecruitMap:" + companyRecruitMap);
	    List<HashMap<String, Object>> companyRecruitSkillList =  commonCompanyRecruitSkillMapper.getCompanyRecruitMySkillList(companyRecruitVo);
		//System.out.println("companyRecruitSkillList:"+companyRecruitSkillList);
	    
	    //System.out.println("companyRecruitMap:" + companyRecruitMap);
	    mv.addObject("companyRecruitSkillList", companyRecruitSkillList);
		mv.addObject("companyUserVo", companyUserVo);
		mv.addObject("educationStatuList", educationStatuList);
		mv.addObject("skillStackList", skillStackList);
		mv.addObject("commonDutyList", commonDutyList);
		mv.addObject("skillList", skillList);
		mv.addObject("regionList", regionList);
		mv.addObject("companyRecruitMap", companyRecruitMap);
		mv.setViewName("/company/recruit/companyRecruitUpdateForm");
		return mv;
	}
	
	@RequestMapping("/CompanyRecruitUpdate")
	public ModelAndView companyRecruitUpdate(HttpSession session, HttpServletRequest request,
			@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		int company_recruit_idx = Integer.parseInt(String.valueOf(map.get("company_recruit_idx")));
		Map<String, String[]> requestMap = request.getParameterMap();
		String[] skills = requestMap.get("skill_idx");
		List<SkillVo> checkedSkillList = new ArrayList<>();
		if (skills != null) {
			for (int i = 0; i < skills.length; i++) {
				SkillVo skillVo = new SkillVo();
				skillVo.setSkill_idx(Integer.parseInt(skills[i]));
				checkedSkillList.add(skillVo);
			};
			commonCompanyRecruitSkillMapper.deleteCommonCompanyRecruitSkill(company_recruit_idx);
			commonCompanyRecruitSkillMapper.setCommonCompanyRecruitSkill(company_recruit_idx ,checkedSkillList);
		};
		if (skills == null) {
			checkedSkillList = null;
		};
		companyRecruitMapper.setCompanyRecruitUpdate(map);
		
		mv.setViewName("redirect:/CompanyRecruit/RecruitList");
		return mv;
		
	}
	
	
	@RequestMapping("/CompanyRecruitOneView")
	public ModelAndView companyRecruitOneView () {
		ModelAndView mv = new ModelAndView();
		CompanyRecruitVo companyRecruitVo = new CompanyRecruitVo();
		companyRecruitVo.setCompany_recruit_idx(14);
		HashMap<String, Object> companyRecruitMap = companyRecruitService.getcompanyRecruitMap(companyRecruitVo);
		System.out.println("companyRecruitMap:" + companyRecruitMap);
		mv.addObject("companyRecruitMap", companyRecruitMap);
		mv.setViewName("/company/recruit/companyRecruitOneView");
		return mv;
		
	}
	

}