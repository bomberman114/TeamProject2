package com.green.user.resume.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.vo.CompanyUserVo;
import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;

@Mapper
public interface UserResumeMapper {

	int getUserResumeCount();

	List<HashMap<String, Object>> getUserResumeList(List<SkillVo> checkedSkillList, List<RegionVo> checkedRegionList,
			int startRow, int endRow);


}
