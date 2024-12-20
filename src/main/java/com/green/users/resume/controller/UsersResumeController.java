 package com.green.users.resume.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.application.mapper.ApplicationMapper;
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
import com.green.user.resume.skill.mapper.CommonUserResumeSkillMapper;
import com.green.users.resume.service.UsersResumeService;
import com.green.users.service.UsersService;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users/MyPage/Resume")
public class UsersResumeController {
	
	@Autowired
	private UsersService usersService;

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
	
	@Autowired
	private CommonUserResumeSkillMapper commonUserResumeSkillMapper;
	
	
	@RequestMapping("/List")
	public ModelAndView resumeList(
			HttpServletRequest request, HttpServletResponse responese) {
		
		HttpSession session = request.getSession();
		UserVo vo           = (UserVo) session.getAttribute("userLogin");
		List<HashMap<String, Object>> resumeList = usersResumeService.findResumeAll(vo);
		System.out.println(resumeList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.addObject("resumeList",resumeList);
		mv.setViewName("/users/resume/personalResumeList");
		return mv;
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView resumeWriteForm(
			HttpServletRequest request, HttpServletResponse responese) {
		
		HttpSession session 	        = request.getSession();
		UserVo vo                       = (UserVo) session.getAttribute("userLogin");
		
		HashMap<String, Object> map     = usersService.getUserData(vo);
		
		String userBirthYear            = vo.getUser_birth().substring(0,4);
		vo                              = usersResumeService.findUser(vo);
		List<RegionVo> regionList       = regionMapper.getRegionList();
		List<CommonDutyVo> dutyList     = commonDutyMapper.getCommonDutyList();
		List<SkillStackVo> stackList    = skillStackMapper.getSkillStackList();
		List<SkillVo> initialSkillList  = skillsMapper.getSeletedSkillStackSkillList(1);
		List<EducationStatusVo> eduList = educationStatusMapper.getEducationStatuList();
		System.out.println(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.addObject("userBirthYear",userBirthYear);
		mv.addObject("regionList",regionList);
		mv.addObject("dutyList",dutyList);
		mv.addObject("stackList",stackList);
		mv.addObject("initialSkillList",initialSkillList);
		mv.addObject("eduList",eduList);
		mv.addObject("map",map);
		mv.setViewName("/users/resume/personalResumeWriteForm");
		return mv;
	}
	
	@RequestMapping("/SkillFindById")
	public ResponseEntity<HashMap<String, List<SkillVo>>> skillFindById(@RequestBody Map<String,String> map){
			String stackId = String.valueOf(map.get("stackId"));
			List<SkillVo> selectSkillList = usersResumeService.selectSkillfindAllById(stackId);
			HashMap<String,List<SkillVo>> res = new HashMap<>();
			res.put("selectSkillList", selectSkillList);
			return ResponseEntity.ok(res);
		}
	

	@RequestMapping("/Write")
	public String resumeWrite(
			@RequestParam HashMap<String, Object> map,
			@RequestParam(required = false, value="skill_idx") List<Integer> resumeSkills
			) {
		usersResumeService.saveResume(map,resumeSkills);
		return "redirect:/Users/MyPage/Resume/List";
	}
	
	@RequestMapping("/OneView")
	public ModelAndView oneView(@RequestParam HashMap<String, Object> map, HttpServletRequest request) {
		HttpSession session 	         = request.getSession();
		UserVo userVo                    = (UserVo) session.getAttribute("userLogin");
		HashMap<String, Object> vo       = usersResumeService.resumeFindById(map);
		HashMap<String, Object> userData = usersService.getUserData(userVo);
		vo.put("USER_BIRTH", String.valueOf(vo.get("USER_BIRTH")).substring(0,4));
		ModelAndView mv = new ModelAndView();
	    if(vo.get("CARRER_YEAR") != null || vo.get("CARRER_MONTH") != null ) {
	    	vo.put("CAREER_TYPE","exp");
	    }else {
	    	vo.put("CAREER_TYPE",null);
	    }

        String skillString      = String.valueOf(vo.get("SKILLS"));
        if(skillString == "null") {skillString = "";}

        String[] resumeSkillArr = skillString.split(",");
		vo.put("SKILLS", Arrays.asList(resumeSkillArr));
		mv.addObject("vo",vo);
		mv.addObject("map",userData);
		mv.setViewName("/users/resume/personalResumeOneView");
		return mv;
	}
	
	@RequestMapping("/UpdateForm")
	public ModelAndView resumeUpdateForm(@RequestParam HashMap<String, Object> map, HttpServletRequest request) {
		HashMap<String, Object> vo    				 = usersResumeService.resumeFindById(map);
		HttpSession session 	                     = request.getSession();
		UserVo userVo                                = (UserVo) session.getAttribute("userLogin");
		vo.put("USER_BIRTH", String.valueOf(vo.get("USER_BIRTH")).substring(0,4));
		HashMap<String, Object> userData             = usersService.getUserData(userVo);
		List<RegionVo> regionList       			 = regionMapper.getRegionList();
		List<CommonDutyVo> dutyList   			     = commonDutyMapper.getCommonDutyList();
		List<SkillStackVo> stackList     			 = skillStackMapper.getSkillStackList();
		List<SkillVo> initialSkillList    		     = skillsMapper.getSeletedSkillStackSkillList(1);
		List<EducationStatusVo> eduList   			 = educationStatusMapper.getEducationStatuList();
		List<HashMap<String, Object>> selectedSkills = commonUserResumeSkillMapper.skillsfindById(map);
	    if(vo.get("CARRER_YEAR") != null || vo.get("CARRER_MONTH") != null ) {
	    	vo.put("CAREER_TYPE","exp");
	    }else {
	    	vo.put("CAREER_TYPE",null);
	    }
		ModelAndView mv = new ModelAndView();

		mv.addObject("vo",vo);
		mv.addObject("map",userData);
		mv.addObject("regionList",regionList);
		mv.addObject("dutyList",dutyList);
		mv.addObject("stackList",stackList);
		mv.addObject("initialSkillList",initialSkillList);
		mv.addObject("eduList",eduList);
		mv.addObject("selectedSkills",selectedSkills);
		mv.setViewName("/users/resume/personalResumeUpdateForm");
		return mv;
	}
	
	@RequestMapping("/Update")
	public String resumeUpdate(
			@RequestParam HashMap<String, Object> map,
			@RequestParam(required = false, value="skill_idx") List<Integer> resumeSkills
			) {
		usersResumeService.updateResume(map,resumeSkills);
		return "redirect:/Users/MyPage/Resume/OneView?user_resume_idx=" + String.valueOf(map.get("user_resume_idx"));
	}
	
	@RequestMapping("/Delete")
	public String resumeDelete(
			@RequestParam HashMap<String, Object> map
			) {
		usersResumeService.deleteResume(map);
		return "redirect:/Users/MyPage/Resume/List";
	}
	
}