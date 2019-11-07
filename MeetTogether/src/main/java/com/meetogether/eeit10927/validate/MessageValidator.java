package com.meetogether.eeit10927.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.meetogether.eeit10927.model.Message;

public class MessageValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Message.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "msgTitle", "", "標題未填寫");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "msgText", "", "內容未填寫");
	}

}
