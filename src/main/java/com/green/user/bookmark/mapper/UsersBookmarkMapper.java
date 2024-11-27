package com.green.user.bookmark.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.user.bookmark.vo.UserBookmarkVo;
import com.green.users.vo.UserVo;

@Mapper
public interface UsersBookmarkMapper {

	UserBookmarkVo findById(String userId, String recruitId);

	void saveBookMark(String userId, String recruitId);

	void updateBookMark(UserBookmarkVo vo);

	List<UserBookmarkVo> findAllById(UserVo vo);

	List<HashMap<String, Object>> markUpRecruitList(int user_idx);

	int countById(int user_idx);

}
