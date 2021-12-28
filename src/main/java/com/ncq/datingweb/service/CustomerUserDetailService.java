package com.ncq.datingweb.service;

import com.ncq.datingweb.dto.UserDto;
import com.ncq.datingweb.entities.User;
import com.ncq.datingweb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
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

//    @Autowired
//    PasswordEncoder passwordEncoder;

    public User findByUsername(String userName){
        return userRepository.findByUsername(userName);
    }

//    public User saveUser(UserDto userDto){
//        User user = new User();
//    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = findByUsername(username);
        List<GrantedAuthority> grantedAuthorityList = new ArrayList<>();
        GrantedAuthority authority = new SimpleGrantedAuthority("ADMIN");
        grantedAuthorityList.add(authority);
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), grantedAuthorityList);
        return userDetails;
    }
}
