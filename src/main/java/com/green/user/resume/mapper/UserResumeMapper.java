package com.green.user.resume.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.vo.UserVo;

@Mapper
public interface UserResumeMapper {

	UserVo findUser(UserVo vo);

}
