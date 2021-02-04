package com.eco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.eco.service.MusicService;

@Controller
public class MusicController {
	
	
	@Autowired
	MusicService ms;
}
