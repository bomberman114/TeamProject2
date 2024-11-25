package com.green.education.status.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.education.status.vo.EducationStatusVo;

@Mapper
public interface EducationStatusMapper {

	List<EducationStatusVo> getEducationStatuList();


}
