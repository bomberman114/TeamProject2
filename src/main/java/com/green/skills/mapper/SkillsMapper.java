package com.green.skills.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.skills.vo.SkillVo;

@Mapper
public interface SkillsMapper {

	List<SkillVo> getSkillList();

	List<SkillVo> getSeletedSkillStackSkillList(@Param("skill_stack_idx") Integer skill_stack_idx);

}
