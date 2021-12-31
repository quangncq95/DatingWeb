package com.ncq.datingweb.service;

import com.ncq.datingweb.dto.ChangePassword;
import com.ncq.datingweb.dto.Response;
import com.ncq.datingweb.dto.UserDto;
import com.ncq.datingweb.entities.User;
import com.ncq.datingweb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CustomerUserDetailService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public User saveUser(UserDto userDto) {
        User user = new User();
        user.setName(userDto.getName());
        user.setBday(userDto.getBday());
        user.setGender(userDto.getGender());
        user.setLocation(userDto.getLocation());
        user.setEmail(userDto.getEmail());
        user.setPassword(new BCryptPasswordEncoder().encode(userDto.getPassword()));
        return userRepository.save(user);
    }

    public Response changePass(ChangePassword changePassword) {
        Response response = new Response();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        if (passwordEncoder.matches(changePassword.getCurrent_password(), user.getPassword())){
            userRepository.updatePasswork(user.getId(),passwordEncoder.encode(changePassword.getNew_password()));
            response.setCode(0);
            response.setData("Successful change");
        }else{
            response.setCode(1);
            response.setData("Incorrect password");
        }
        return response;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = findByEmail(email);
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), user.getAuthorities());
        return user;
    }
}
