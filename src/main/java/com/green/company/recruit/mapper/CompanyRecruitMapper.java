package com.green.company.recruit.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CompanyRecruitMapper {


	List<HashMap<String, String>> getCompanyHomeRecruiteList();

	List<HashMap<String, String>> getCompanyRecruiteSkillStackList();

}
