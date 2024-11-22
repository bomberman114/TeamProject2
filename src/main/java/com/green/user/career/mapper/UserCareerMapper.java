package com.green.user.career.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

<<<<<<< HEAD
import com.green.user.career.vo.UserCareerVo;

=======
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
@Mapper
public interface UserCareerMapper {

	void saveResumeCareer(HashMap<String, Object> map);

<<<<<<< HEAD
	UserCareerVo resumeCareerfindById(HashMap<String, Object> map);

	void updateResumeCareer(HashMap<String, Object> map);

=======
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
}
