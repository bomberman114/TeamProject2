package com.green.common.duty.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.common.duty.vo.CommonDutyVo;

@Mapper
public interface CommonDutyMapper {

	List<CommonDutyVo> getCommonDutyList();

}
