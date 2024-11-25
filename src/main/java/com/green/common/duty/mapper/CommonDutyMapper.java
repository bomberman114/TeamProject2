package com.green.common.duty.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.common.duty.vo.CommonDutyVo;

@Mapper
public interface CommonDutyMapper {

	List<CommonDutyVo> getCommonDutyList();

	List<CommonDutyVo> getCheckedCommonDutyList(@Param("checkedCommonDutyList") List<CommonDutyVo> checkedCommonDutyList);

}
