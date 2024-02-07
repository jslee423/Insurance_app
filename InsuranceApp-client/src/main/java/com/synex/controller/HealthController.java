package com.synex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HealthController {

	@RequestMapping("health")
	public ModelAndView health() {
		ModelAndView mav = new ModelAndView("health");
		
		return mav;
	} 
}
