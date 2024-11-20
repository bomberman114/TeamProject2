package com.green.company.recruit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.company.recruit.service.CompanyRecruitService;

@Controller
@RequestMapping("/CompanyRecruit")
public class CompanyRecruitController {

	@Autowired
	private  CompanyRecruitService companyRecruitService;
}
