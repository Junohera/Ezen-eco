package com.eco.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eco.service.TasteService;

@Controller
public class TasteController {
	
	@Autowired
	TasteService tasteService;
	
	@RequestMapping(value = "/tasteChoice", method = RequestMethod.GET)
	public String tasteChoice(Model model, HttpServletRequest request) {
		
		return "music/tasteChoice";
	}
	@RequestMapping(value = "/tasteView", method = RequestMethod.GET)
	public String tasteView(Model model, HttpServletRequest request) {
		
		return "music/tasteView";
	}
	
	@RequestMapping(value = "/tasteSave", method = RequestMethod.POST)
	public String tasteSave(Model model, HttpServletRequest request) {
		
		return "redirect:/tasteView";
	}
}
