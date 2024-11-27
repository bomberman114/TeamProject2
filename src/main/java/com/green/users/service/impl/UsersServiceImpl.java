package com.green.users.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.application.mapper.ApplicationMapper;
import com.green.user.mapper.UserMapper;
import com.green.users.service.UsersService;
import com.green.users.vo.UserVo;

@Service("UsersService")
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private ApplicationMapper applicationMapper;
	
	@Override
	public void saveUser(HashMap<String, Object> map) {
		userMapper.saveUser(map);
		
	}

	@Override
	public UserVo login(String userid, String passwd) {
		UserVo user = userMapper.login(userid,passwd);
		return user;
	}

	@Override
	public Boolean isUserIdDupCheck(String userId) {
		Boolean result = userMapper.isUserIdDupCheck(userId) != null ?
				true : false;
		return result;
	}

	@Override
	public Boolean isUserExist(String userId, String userPd) {
		Boolean result = userMapper.login(userId,userPd) != null ?
				true : false;
		return result;
	}

	@Override
	public void updateUser(HashMap<String, Object> map) {
		userMapper.updateUser(map);
	}

	@Override
	public UserVo findById(int user_idx) {
		UserVo vo = userMapper.findById(user_idx);
		return vo;
	}

	@Override
	public HashMap<String, Object> findApplyCountListById(Map<String, String> map) {
		HashMap<String, Object> applyConutList = applicationMapper.findApplyCountListById(map);
		return applyConutList;
	}


	@Override
	public void userApplySubmit(Map<String, String> map) {
		applicationMapper.userApplySubmit(map);

	}

	@Override
	public List<HashMap<String, Object>> findApplyList(Map<String, String> map) {
		List<HashMap<String, Object>> applyList = applicationMapper.findApplyList(map);
		return applyList;
	}


}
