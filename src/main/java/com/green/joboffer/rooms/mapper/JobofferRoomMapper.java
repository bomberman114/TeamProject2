package com.green.joboffer.rooms.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JobofferRoomMapper {


	void setJobOfferRoomCreate(HashMap<String, Object> map);

	int getJobofferRoomIdx(HashMap<String, Object> map);


	List<HashMap<String, Object>> getJobOfferRoomActiveList(HashMap<String, Object> map);

	int getJobOfferRoomActiveListCount(HashMap<String, Object> map);

}
