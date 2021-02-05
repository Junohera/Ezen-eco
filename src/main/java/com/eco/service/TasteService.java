package com.eco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.TasteDao;

@Service
public class TasteService {

	@Autowired
	TasteDao tasteDao;
	
}
