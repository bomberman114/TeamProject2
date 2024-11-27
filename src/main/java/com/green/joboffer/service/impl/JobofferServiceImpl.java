package com.green.joboffer.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.joboffer.message.mapper.JobofferMessageMapper;
import com.green.joboffer.rooms.mapper.JobofferRoomMapper;
import com.green.joboffer.service.JobofferService;

@Service("JobofferService")
public class JobofferServiceImpl implements JobofferService{
	
	@Autowired
	private JobofferRoomMapper JobofferRoomMapper;
	
	@Autowired
	private JobofferMessageMapper  jobofferMessageMapper;

	@Override
	public List<HashMap<String, Object>> getJobofferMessageList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> jobofferMessageList = jobofferMessageMapper.getJobofferMessageList(map); 
		for(int i = 0 ; i < jobofferMessageList.size(); i++ ){
			jobofferMessageList.get(i).get("MESSAGE_CONTENT_JOB_OFFERS_REGDATE");
			
		}
		return jobofferMessageList;
	}

}
