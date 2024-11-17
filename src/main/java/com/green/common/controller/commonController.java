package com.green.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.common.service.CommonService;

@Controller
@RequestMapping("/Common")
public class commonController {
	
	@Autowired
	private CommonService commonService;

}
