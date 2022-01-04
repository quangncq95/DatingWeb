package com.ncq.datingweb.handlers;

import com.ncq.datingweb.entities.UserAccount;
import com.ncq.datingweb.service.CustomerUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    CustomerUserDetailService customerUserDetailService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        UserAccount userAccount = this.customerUserDetailService.findByEmail(authentication.getName());
        request.getSession().setAttribute("currentUser", userAccount);
        response.sendRedirect("/encounters");
    }
}
