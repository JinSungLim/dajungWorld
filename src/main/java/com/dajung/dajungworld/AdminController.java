package com.dajung.dajungworld;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dajung.dajungworld.service.AdminMapper;


	@Controller
	public class AdminController {

	@Autowired
	private AdminMapper adminMapper;
	
	@RequestMapping(value = "/admin_main.do" , method = RequestMethod.GET)
		public String adminMain () {
		
		return "admin/admin_main";
		
		}
	
	}
	
