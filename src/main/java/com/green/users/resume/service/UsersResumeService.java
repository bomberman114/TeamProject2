package com.green.users.resume.service;

import java.util.HashMap;
import java.util.List;

import com.green.common.duty.vo.CommonDutyVo;
import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;
import com.green.users.vo.UserVo;

public interface UsersResumeService {

	HashMap<String, Object> getuserResumeMap(HashMap<String, Object> map);

	UserVo findUser(UserVo vo);

	void saveResume(HashMap<String, Object> map, List<Integer> resumeSkills);

	List<HashMap<String, Object>> findResumeAll(UserVo vo);

	List<SkillVo> selectSkillfindAllById(String stackId);

	HashMap<String, Object> resumeFindById(HashMap<String, Object> map);

	void updateResume(HashMap<String, Object> map, List<Integer> resumeSkills);

	void deleteResume(HashMap<String, Object> map);

	List<HashMap<String, Object>> getUserResumeList(List<String> checkedSkillListToTypeString,
			List<RegionVo> checkedRegionList, List<CommonDutyVo> checkedCommonDutyList, int startRow, int endRow, String condition);

}
