package com.green.user.resume.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.common.duty.vo.CommonDutyVo;
import com.green.company.vo.CompanyUserVo;
import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;
import com.green.users.vo.UserVo;
import com.green.user.resume.vo.UserResumeVo;


@Mapper
public interface UserResumeMapper {

	UserVo findUser(UserVo vo);
	
	int getUserResumeCount();

	List<HashMap<String, Object>> getUserResumeList(List<SkillVo> checkedSkillList, List<RegionVo> checkedRegionList,
			int startRow, int endRow);
	
	void saveResume(HashMap<String, Object> map);
	
	List<HashMap<String, Object>> findResumeAll(UserVo vo);
	
	List<SkillVo> selectSkillfindAllById(String stackId);

	HashMap<String, Object> resumeFindById(HashMap<String, Object> map);

	void updateResume(HashMap<String, Object> map);

	void deleteResume(HashMap<String, Object> map);

	List<HashMap<String, Object>> getUserResumeList(@Param("checkedSkillListToTypeString") List<String> checkedSkillListToTypeString,@Param("checkedRegionList") List<RegionVo> checkedRegionList,
			@Param("checkedCommonDutyList") List<CommonDutyVo> checkedCommonDutyList, @Param("startRow") int startRow, @Param("endRow") int endRow);

	HashMap<String, Object> getuserResumeMap(HashMap<String, Object> map);

	void updateUserResumeApply(HashMap<String, Object> map);

	int countById(UserVo vo);


}

