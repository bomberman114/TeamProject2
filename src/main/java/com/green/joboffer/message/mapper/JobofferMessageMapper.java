package com.green.joboffer.message.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JobofferMessageMapper {

	List<HashMap<String, Object>> getJobofferMessageList(HashMap<String, Object> map);

	void setMessageFrist(HashMap<String, Object> map);

}
