package com.green.user.resume.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;
import com.green.users.vo.UserVo;

@Mapper
public interface UserResumeMapper {

	UserVo findUser(UserVo vo);
	
	int getUserResumeCount();

	List<HashMap<String, Object>> getUserResumeList(List<SkillVo> checkedSkillList, List<RegionVo> checkedRegionList,
			int startRow, int endRow);
	
	void saveResume(HashMap<String, Object> map);
	
	List<HashMap<String, Object>> findResumeAll(UserVo vo);
}

