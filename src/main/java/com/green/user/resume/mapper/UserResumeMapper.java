package com.green.user.resume.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;
<<<<<<< HEAD
import com.green.user.resume.vo.UserResumeVo;
=======
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
import com.green.users.vo.UserVo;

@Mapper
public interface UserResumeMapper {

	UserVo findUser(UserVo vo);
	
	int getUserResumeCount();

	List<HashMap<String, Object>> getUserResumeList(List<SkillVo> checkedSkillList, List<RegionVo> checkedRegionList,
			int startRow, int endRow);
	
	void saveResume(HashMap<String, Object> map);
	
	List<HashMap<String, Object>> findResumeAll(UserVo vo);
<<<<<<< HEAD
	
	List<SkillVo> selectSkillfindAllById(String stackId);

	HashMap<String, Object> resumeFindById(HashMap<String, Object> map);

	void updateResume(HashMap<String, Object> map);
=======
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
}

