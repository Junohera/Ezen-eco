package com.eco.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eco.service.BundleService;

@Controller
public class BundleController {
	
	@Autowired
	BundleService bundleService;

	@RequestMapping(value = "/bundle", method = RequestMethod.GET)
	public String bundle(Model model, HttpServletRequest request) {
		
		return "music/bundle";
	}
	@RequestMapping(value = "/addBundle", method = RequestMethod.POST)
	public String addBundle(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
	}
	@RequestMapping(value = "/modBundle", method = RequestMethod.POST)
	public String modBundle(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
	}
	@RequestMapping(value = "/addBundleDetail", method = RequestMethod.POST)
	public String addBundleDetail(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
	}
	@RequestMapping(value = "/delBundleDetail", method = RequestMethod.POST)
	public String delBundleDetail(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
	}
}
