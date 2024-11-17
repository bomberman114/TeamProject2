package com.green.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.users.service.UsersService;

@Controller
@RequestMapping("/Users")
public class UsersController {
	
	@Autowired
	private UsersService usersService;

}
