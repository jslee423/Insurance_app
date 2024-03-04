package com.synex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.synex.util.ChatGPTAPI;

@Controller
public class ChatGPTController {

	@GetMapping("chatGPT")
	public String chatGPT() {
		return "chatGPT";
	} 
	
	@PostMapping("askGPT")
	public ModelAndView askGPT(String prompt) {
		ModelAndView mav = new ModelAndView("chatGPT");
		String response = ChatGPTAPI.chatGPT(prompt);
		mav.addObject("response", response);
		
		return mav;
	}
}
