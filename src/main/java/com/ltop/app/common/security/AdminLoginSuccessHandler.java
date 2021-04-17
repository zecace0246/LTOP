package com.ltop.app.common.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class AdminLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
        List<String> roleNames = new ArrayList<>();

        System.out.println(" auth ::>> "+ auth);

        System.out.println(""+ auth.getPrincipal());

        auth.getAuthorities().forEach(authority -> {
            roleNames.add(authority.getAuthority());
        });

        if (roleNames.contains("ROLE_MEMBER") || roleNames.contains("ROLE_ADMIN") ) {

            response.sendRedirect("/home");
            return;
        }

        response.sendRedirect("/member/adminLogin");
    }
}


