package com.green.users.resume.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.common.duty.mapper.CommonDutyMapper;
import com.green.common.duty.vo.CommonDutyVo;
import com.green.education.status.mapper.EducationStatusMapper;
import com.green.education.status.vo.EducationStatusVo;
import com.green.region.mapper.RegionMapper;
import com.green.region.vo.RegionVo;
import com.green.skills.mapper.SkillsMapper;
import com.green.skills.stack.mapper.SkillStackMapper;
import com.green.skills.stack.vo.SkillStackVo;
import com.green.skills.vo.SkillVo;
import com.green.user.education.vo.UserEducationVo;
import com.green.user.resume.vo.UserResumeVo;
import com.green.users.resume.service.UsersResumeService;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users/MyPage/Resume")
public class UsersResumeController {
	
	@Autowired
	private UsersResumeService usersResumeService;
	
	@Autowired
	private CommonDutyMapper commonDutyMapper;
	
	@Autowired
	private SkillStackMapper skillStackMapper;
	
	@Autowired
	private SkillsMapper skillsMapper;
	
	@Autowired
	private EducationStatusMapper educationStatusMapper;
	
	@Autowired
	private RegionMapper regionMapper;
	
	@RequestMapping("/List")
	public ModelAndView resumeList(
			HttpServletRequest request, HttpServletResponse responese) {
		
		HttpSession session = request.getSession();
		UserVo vo           = (UserVo) session.getAttribute("userLogin");
		/*List<HashMap<String, Object>> resumeList = usersResumeService.findResumeAll(vo);*/
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		/*mv.addObject("resumeList",resumeList);*/
		mv.setViewName("/users/resume/personalResumeList");
		return mv;
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView resumeWriteForm(
			HttpServletRequest request, HttpServletResponse responese) {
		
		HttpSession session 	        = request.getSession();
		UserVo vo                       = (UserVo) session.getAttribute("userLogin");
		String userBirthYear            = vo.getUser_birth().substring(0,4);
		vo                              = usersResumeService.findUser(vo);
		List<RegionVo> regionList       = regionMapper.getRegionList();
		List<CommonDutyVo> dutyList     = commonDutyMapper.getCommonDutyList();
		List<SkillStackVo> stackList    = skillStackMapper.getSkillStackList();
		List<SkillVo> initialSkillList  = skillsMapper.getSeletedSkillStackSkillList(1);
		List<EducationStatusVo> eduList = educationStatusMapper.getEducationStatuList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.addObject("userBirthYear",userBirthYear);
		mv.addObject("regionList",regionList);
		mv.addObject("dutyList",dutyList);
		mv.addObject("stackList",stackList);
		mv.addObject("initialSkillList",initialSkillList);
		mv.addObject("eduList",eduList);
		mv.setViewName("/users/resume/personalResumeWriteForm");
		return mv;
	}
	
	@RequestMapping("/Write")
	public String resumeWrite(
			@RequestParam HashMap<String, Object> map,
			@RequestParam(required = false, value="skill_idx") List<Integer> resumeSkills
			) {
		System.out.println(map);
		System.out.println(resumeSkills);
		usersResumeService.saveResume(map,resumeSkills);
		return "redirect:/Users/MyPage/Resume/List";
	}
}