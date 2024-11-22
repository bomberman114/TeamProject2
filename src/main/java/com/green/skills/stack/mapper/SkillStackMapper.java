package com.green.skills.stack.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.skills.stack.vo.SkillStackVo;

@Mapper
public interface SkillStackMapper {

	List<SkillStackVo> getSkillStackList();

}
