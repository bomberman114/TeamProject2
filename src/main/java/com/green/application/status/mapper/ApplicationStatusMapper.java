package com.green.application.status.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.application.status.vo.ApplicationStatusVo;

@Mapper
public interface ApplicationStatusMapper {

	List<ApplicationStatusVo> getapplicationStatuList();

}
