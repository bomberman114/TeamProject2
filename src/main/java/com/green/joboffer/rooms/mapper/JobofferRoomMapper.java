package com.green.joboffer.rooms.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JobofferRoomMapper {

	List<HashMap<String, Object>> getJobOfferRoomList(HashMap<String, Object> map);

	void setJobOfferRoomCreate(HashMap<String, Object> map);

}
