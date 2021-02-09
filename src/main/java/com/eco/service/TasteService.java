package com.eco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eco.dao.ITasteDao;

@Service
public class TasteService {

	@Autowired
	ITasteDao tasteDao;
	
}
