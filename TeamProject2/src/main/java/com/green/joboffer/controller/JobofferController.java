package com.green.joboffer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.joboffer.service.JobofferService;

@Controller
@RequestMapping("/Joboffer")
public class JobofferController {
	
	@Autowired
	private JobofferService jobofferService;

}
