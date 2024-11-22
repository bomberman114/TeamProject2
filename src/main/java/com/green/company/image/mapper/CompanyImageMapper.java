package com.green.company.image.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.image.vo.CompanyImageVo;

@Mapper
public interface CompanyImageMapper {


	void deleteProfile(HashMap<String, Object> map);



	List<CompanyImageVo> getCompanyProfileImge(HashMap<String, Object> map);


	void deleteCompanyImge(HashMap<String, Object> map);

	void setCompanyImage(HashMap<String, Object> map);

<<<<<<< HEAD

	int setCompanyImageCountCheck(HashMap<String, Object> map);

=======
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
}
