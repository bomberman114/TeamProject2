package com.green.company.image.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.image.vo.CompanyImageVo;
import com.green.company.recruit.vo.CompanyRecruitVo;

@Mapper
public interface CompanyImageMapper {

	void deleteProfile(HashMap<String, Object> map);

	List<CompanyImageVo> getCompanyProfileImge(HashMap<String, Object> map);

	void deleteCompanyImge(HashMap<String, Object> map);

	void setCompanyImage(HashMap<String, Object> map);

	int setCompanyImageCountCheck(HashMap<String, Object> map);

	HashMap<String, Object> findById(CompanyRecruitVo vo);

}
