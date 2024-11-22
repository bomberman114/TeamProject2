package com.green.user.resume.intro.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.green.user.resume.intro.vo.UserResumeIntroVo;

@Mapper
public interface UserResumeIntroMapper {

	void saveResumeIntro(HashMap<String, Object> map);

	void updateResumeIntro(HashMap<String, Object> map);

}
