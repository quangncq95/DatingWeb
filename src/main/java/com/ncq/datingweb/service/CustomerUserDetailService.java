package com.ncq.datingweb.service;

import com.ncq.datingweb.dto.ChangePassword;
import com.ncq.datingweb.dto.ProfileDto;
import com.ncq.datingweb.dto.Response;
import com.ncq.datingweb.dto.UserAccountDto;
import com.ncq.datingweb.entities.UserAccount;
import com.ncq.datingweb.entities.UserDetailsEntities;
import com.ncq.datingweb.repository.UserAccountRepository;
import com.ncq.datingweb.repository.UserDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class CustomerUserDetailService implements UserDetailsService {

    @Autowired
    UserAccountRepository userAccountRepository;

    @Autowired
    UserDetailsRepository userDetailsRepository;

    public UserAccount findByEmail(String email) {
        return userAccountRepository.findByEmail(email);
    }

    public UserAccount saveUserAccount(UserAccountDto userAccountDto) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        UserAccount userAccount = new UserAccount();
        userAccount.setEmail(userAccountDto.getEmail());
        userAccount.setPassword(passwordEncoder.encode(userAccountDto.getPassword()));
        return userAccountRepository.save(userAccount);
    }

    public UserDetailsEntities saveUserDetails(ProfileDto profileDto){
        UserDetailsEntities userDetailsEntities = new UserDetailsEntities();
        userDetailsEntities.setId_account(profileDto.getId_account());
        userDetailsEntities.setName(profileDto.getName());
        userDetailsEntities.setGender(profileDto.getGender());
        userDetailsEntities.setBirthday(profileDto.getBirthday());
        userDetailsEntities.setCity(profileDto.getCity());
        userDetailsEntities.setIntroduce(profileDto.getIntroduce());
        userDetailsEntities.setEducation(profileDto.getEducation());
        userDetailsEntities.setCareer(profileDto.getCareer());
        return userDetailsRepository.save(userDetailsEntities);
    }

    public Response changePass(ChangePassword changePassword) {
        Response response = new Response();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserAccount userAccount = (UserAccount) authentication.getPrincipal();
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        if (passwordEncoder.matches(changePassword.getCurrent_password(), userAccount.getPassword())){
            userAccountRepository.updatePasswork(userAccount.getId_account(),passwordEncoder.encode(changePassword.getNew_password()));
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
        UserAccount userAccount = findByEmail(email);
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(userAccount.getEmail(), userAccount.getPassword(), userAccount.getAuthorities());
        return userAccount;
    }
}
