package com.green.company.recruit.controller;

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
	

	// 회사가 자기들 채용공고 보기
	@RequestMapping("/RecruitList")
	public ModelAndView recruitList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");
		// List<HashMap<String, Object>> companyRecruitList =
		// companyRecruitMapper.getCompanyRecruiteList(companyUserVo);
		List<HashMap<String, Object>> companyRecruitList = companyRecruitService.getCompanyRecruiteList(companyUserVo);

		mv.setViewName("");
		return mv;

	}

	// 데드라이 지난 공고보기
	@RequestMapping("/RecruittListDead")
	public ModelAndView recruittListDeadline(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");

		List<HashMap<String, Object>> companyRecruitDeadList = companyRecruitService
				.getCompanyRecruiteDeadList(companyUserVo);

		mv.setViewName("");
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

	@RequestMapping("/RecruitWrite")
	public ModelAndView recruitWrite(HttpSession session, HttpServletRequest request,
			@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companylogin");

		Map<String, String[]> requestMap = request.getParameterMap();
		String[] skills = requestMap.get("skill_idx");
		List<SkillVo> checkedSkillList = new ArrayList<>();
		if (skills != null) {
			for (int i = 0; i < skills.length; i++) {
				SkillVo skillVo = new SkillVo();
				skillVo.setSkill_idx(Integer.parseInt(skills[i]));
				checkedSkillList.add(skillVo);
			};
		};
		if (skills == null) {
			checkedSkillList = null;
		};
		//System.out.println(map);
		//System.out.println(checkedSkillList);
		 companyRecruitMapper.setCompanyRecruitInsert(map);
		 int company_recruit_idx = companyRecruitMapper.getCompanyRecruitIdx(companyUserVo);
		//System.out.println("company_recruit_idx:" + company_recruit_idx);
		commonCompanyRecruitSkillMapper.setCommonCompanyRecruitSkill(company_recruit_idx ,checkedSkillList);
		
		mv.setViewName(null);
		return mv;
	}

	@RequestMapping("/SeletedSkillStackSkillList")
	@ResponseBody
	public List<SkillVo> seletedSkillStackSkillList(@RequestParam(name = "skill_stack_idx") Integer skill_stack_idx) {
		List<SkillVo> skillList = skillsMapper.getSeletedSkillStackSkillList(skill_stack_idx);
		return skillList;
	}
}
