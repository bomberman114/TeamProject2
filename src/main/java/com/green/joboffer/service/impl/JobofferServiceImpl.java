package com.green.joboffer.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.files.FileImage;
import com.green.joboffer.message.mapper.JobofferMessageMapper;
import com.green.joboffer.rooms.mapper.JobofferRoomMapper;
import com.green.joboffer.service.JobofferService;

@Service("JobofferService")
public class JobofferServiceImpl implements JobofferService{
	
	@Autowired
	private JobofferRoomMapper JobofferRoomMapper;
	
	@Autowired
	private JobofferMessageMapper  jobofferMessageMapper;
	
	private String formatDateKorean(String dateStr) {
		// 입력 문자열에서 날짜 부분만 추출
		  // 원본 날짜 포맷 정의
        SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        
        // 원하는 날짜 포맷 정의
        SimpleDateFormat desiredFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
        // 문자열을 Date 객체로 변환
        Date date = null;
		try {
			date = originalFormat.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        // 원하는 형식으로 변환
        String formattedDate = desiredFormat.format(date);
        // 결과 출력
        //System.out.println(formattedDate);

		// LocalDate를 한글 형식으로 변환
		return formattedDate;
	}
	
	public String fileNemeReplace(String fileName) {
		fileName = fileName.replace("\\", "/");
		String path = "/img/commonImage/";
		fileName = path + fileName;
		return fileName;
	}

	@Override
	public List<HashMap<String, Object>> getJobofferMessageList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> jobofferMessageList = jobofferMessageMapper.getJobofferMessageList(map);
		for(int i = 0 ; i < jobofferMessageList.size(); i++ ){
		String 	messageContentJobOffersRegdate= String.valueOf(jobofferMessageList.get(i).get("MESSAGE_CONTENT_JOB_OFFERS_REGDATE"));
			messageContentJobOffersRegdate = formatDateKorean(messageContentJobOffersRegdate);
			jobofferMessageList.get(i).put("MESSAGE_CONTENT_JOB_OFFERS_REGDATE",messageContentJobOffersRegdate);
			if(jobofferMessageList.get(i).get("USER_SFILE_NAME") != null) {
				String userFile = String.valueOf(jobofferMessageList.get(i).get("USER_SFILE_NAME"));
				userFile = fileNemeReplace(userFile);
				jobofferMessageList.get(i).put("USER_SFILE_NAME",userFile);
			};
			
			if(jobofferMessageList.get(i).get("COMPANY_SFILE_NAME") != null) {
				String companyUserFile = String.valueOf(jobofferMessageList.get(i).get("COMPANY_SFILE_NAME"));
				companyUserFile = fileNemeReplace(companyUserFile);
				jobofferMessageList.get(i).put("COMPANY_SFILE_NAME",companyUserFile);
			};
						
		};
		return jobofferMessageList;
	}

		

	@Override
	public List<HashMap<String, Object>> getJobOfferRoomActiveList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> jobOfferRoomActiveList = JobofferRoomMapper.getJobOfferRoomActiveList(map);
		for (int i = 0; i < jobOfferRoomActiveList.size(); i++) {
			String jobofferRoomRegdate = String.valueOf(jobOfferRoomActiveList.get(i).get("JOBOFFER_ROOM_REGDATE"));
			jobofferRoomRegdate = formatDateKorean(jobofferRoomRegdate);
			jobOfferRoomActiveList.get(i).put("JOBOFFER_ROOM_REGDATE", jobofferRoomRegdate);
			
			if(jobOfferRoomActiveList.get(i).get("USER_SFILE_NAME") != null) {
				String userSfileName = String.valueOf(jobOfferRoomActiveList.get(i).get("USER_SFILE_NAME") );
				userSfileName = fileNemeReplace(userSfileName);
				jobOfferRoomActiveList.get(i).put("USER_SFILE_NAME", userSfileName);
			};
			if(jobOfferRoomActiveList.get(i).get("COMPANY_SFILE_NAME") != null) {
				String companyUserSfileName = String.valueOf(jobOfferRoomActiveList.get(i).get("COMPANY_SFILE_NAME"));
				companyUserSfileName = fileNemeReplace(companyUserSfileName);
				jobOfferRoomActiveList.get(i).put("COMPANY_SFILE_NAME", companyUserSfileName);
			};
			if(jobOfferRoomActiveList.get(i).get("MESSAGE_CONTENT_JOB_OFFERS_REGDATE") != null) {
				String  messageContentJobOffersRegdate = String.valueOf(jobOfferRoomActiveList.get(i).get("MESSAGE_CONTENT_JOB_OFFERS_REGDATE"));
				messageContentJobOffersRegdate = formatDateKorean(messageContentJobOffersRegdate);
				jobOfferRoomActiveList.get(i).put("MESSAGE_CONTENT_JOB_OFFERS_REGDATE", messageContentJobOffersRegdate); 
			};
			
			
			
		};
		
		
		return jobOfferRoomActiveList;
	}

}
