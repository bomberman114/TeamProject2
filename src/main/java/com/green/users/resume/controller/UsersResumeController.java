package com.green.users.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.users.resume.service.UsersResumeService;

@Controller
@RequestMapping("UsersResume")
public class UsersResumeController {
	
	@Autowired
	private UsersResumeService usersResumeService;

}
