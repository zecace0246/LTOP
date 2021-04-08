package com.ltop.app.common.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j;

@Log4j
public class AdminNoOpPasswordEncoder implements PasswordEncoder {

	public String encode(CharSequence rawPassword) {
		return rawPassword.toString();
	}

	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return rawPassword.toString().equals(encodedPassword);
	}

}
