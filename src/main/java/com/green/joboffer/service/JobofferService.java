package com.green.joboffer.service;

import java.util.HashMap;
import java.util.List;

public interface JobofferService {

	List<HashMap<String, Object>> getJobofferMessageList(HashMap<String, Object> map);

	List<HashMap<String, Object>> getJobOfferRoomCompanyUserList(HashMap<String, Object> map);

}
