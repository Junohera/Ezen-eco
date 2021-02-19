package com.eco.admin.valid;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.eco.dto.ArtistVO;

public class ArtistValidator implements Validator{

	@Override
	public void validate(Object target, Errors errors) {
		ArtistVO dto = (ArtistVO)target;
		System.out.println("System.out.println(dto);");
		System.out.println(dto);
		
		if (dto.getName() == null || dto.getName().trim().isEmpty()) errors.rejectValue("name", "name");
		if (dto.getGroupyn() == null || dto.getGroupyn().isEmpty()) errors.rejectValue("groupyn", "groupyn");
		if (dto.getGender() == null || dto.getGender().isEmpty()) errors.rejectValue("gender", "gender");
		if (dto.getGseq() == 0) errors.rejectValue("gseq", "genre");
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

}
