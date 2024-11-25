package com.green.user.resume.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.common.duty.vo.CommonDutyVo;
import com.green.company.vo.CompanyUserVo;
import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;
import com.green.user.resume.vo.UserResumeVo;

@Mapper
public interface UserResumeMapper {

	int getUserResumeCount();

	List<HashMap<String, Object>> getUserResumeList(@Param("checkedSkillListToTypeString") List<String> checkedSkillListToTypeString,@Param("checkedRegionList") List<RegionVo> checkedRegionList,
			@Param("checkedCommonDutyList") List<CommonDutyVo> checkedCommonDutyList, @Param("startRow") int startRow, @Param("endRow") int endRow);

	HashMap<String, Object> getuserResumeMap(HashMap<String, Object> map);

	void updateUserResumeApply(HashMap<String, Object> map);


}
