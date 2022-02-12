package com.ncq.datingweb.controller;

import com.ncq.datingweb.dto.*;
import com.ncq.datingweb.entities.InterestedEntities;
import com.ncq.datingweb.entities.UserAccount;
import com.ncq.datingweb.entities.UserDetailsEntities;
import com.ncq.datingweb.entities.UserImagesEntity;
import com.ncq.datingweb.service.CustomerUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    CustomerUserDetailService customerUserDetailService;

    @RequestMapping("/home")
    public String getHome(Model model) {
        model.addAttribute("title", "Mabel");
        return "/home";
    }

//    @RequestMapping(value = "/j_spring_security_check", method = RequestMethod.POST)
//    public String check(Model model){
//        if (SecurityContextHolder.getContext().getAuthentication() != null){
//            model.addAttribute("message","Tài khoản hoặc mật khẩu không chính xác");
//        }
//        return "/home";
//    }

    @RequestMapping("/change_pass")
    public String changePass(Model model) {
        model.addAttribute("title", "Mabel-ChangePassword");
        return "/change_pass";
    }

    // API get image of account
    @GetMapping(value = "/get-userimage")
    public @ResponseBody List<UserImagesEntity> getUserImage(Principal principal){
        UserAccount userAccount = customerUserDetailService.findByEmail(principal.getName());
        List<UserImagesEntity> userImagesEntities = customerUserDetailService.findAllById_account(userAccount.getId_account());
        return userImagesEntities;
    }


    //API get userDetails
    @GetMapping("/get-profile")
    public @ResponseBody List<UserDetaisDto> getProfile(Principal principal) {
        UserAccount userAccount = customerUserDetailService.findByEmail(principal.getName());
        UserDetailsEntities userDetailsEntity = customerUserDetailService.findFirstById_account(userAccount.getId_account());
        String gender = "Male";
        if (userDetailsEntity.getGender().equals("Male")) {
            gender = "Female";
        }
        List<UserDetailsEntities> userDetailsEntities = customerUserDetailService.findAllByGender(gender);
        List<UserDetaisDto> userDetaisDtos = new ArrayList<>();
        for (int i = 0; i < userDetailsEntities.size(); i++) {
            UserDetaisDto userDetaisDto = new UserDetaisDto();
            userDetaisDto.setId_account(userDetailsEntities.get(i).getIdAccount());
            userDetaisDto.setName(userDetailsEntities.get(i).getName());
            userDetaisDto.setBirthday(userDetailsEntities.get(i).getBirthday());
            userDetaisDto.setCity(userDetailsEntities.get(i).getCity());
            userDetaisDto.setIntroduce(userDetailsEntities.get(i).getIntroduce());
            userDetaisDto.setEducation(userDetailsEntities.get(i).getEducation());
            userDetaisDto.setCareer(userDetailsEntities.get(i).getCareer());
            List<UserImagesEntity> userImagesEntities = customerUserDetailService.findAllById_account(userDetailsEntities.get(i).getIdAccount());
            List<UserImagesDto> userImagesDtos = new ArrayList<>();
            for (int j = 0; j < userImagesEntities.size(); j++) {
                UserImagesDto userImagesDto = new UserImagesDto();
                userImagesDto.setName_images(userImagesEntities.get(j).getName_images());
                userImagesDtos.add(userImagesDto);
            }
            userDetaisDto.setUserImages(userImagesDtos);
            userDetaisDtos.add(userDetaisDto);
        }
        return userDetaisDtos;
    }

    // api liked you
    @GetMapping("/api-liked-you")
    public @ResponseBody List<UserDetaisDto> getProfileLiked(Principal principal){
        UserAccount userAccount = customerUserDetailService.findByEmail(principal.getName());
        List<InterestedEntities> interestedEntities = customerUserDetailService.findAllByIdAccount(userAccount.getId_account());
        List<UserDetaisDto> userDetaisDtos = new ArrayList<>();
        for (int i = 0; i < interestedEntities.size(); i++) {
            List<InterestedEntities> interestedEntities1 = customerUserDetailService.findAllByIdAccount(interestedEntities.get(i).getIdLiked());
            for (int j = 0; j < interestedEntities1.size(); j++) {
                if (interestedEntities1.get(j).getIdLiked()==interestedEntities.get(i).getIdAccount()){
                    UserDetaisDto userDetaisDto = new UserDetaisDto();
                    UserDetailsEntities userDetailsEntities = customerUserDetailService.findFirstById_account(interestedEntities1.get(j).getIdAccount());
                    List<UserImagesEntity> userImagesEntity = customerUserDetailService.findAllById_account(interestedEntities1.get(j).getIdAccount());
                    userDetaisDto.setId_account(userDetailsEntities.getIdAccount());
                    userDetaisDto.setName(userDetailsEntities.getName());
                    userDetaisDto.setBirthday(userDetailsEntities.getBirthday());
                    userDetaisDto.setCity(userDetailsEntities.getCity());
                    userDetaisDto.setIntroduce(userDetailsEntities.getIntroduce());
                    userDetaisDto.setEducation(userDetailsEntities.getEducation());
                    userDetaisDto.setCareer(userDetailsEntities.getCareer());
                    List<UserImagesDto> userImagesDtos = new ArrayList<>();
                    for (int k = 0; k < userImagesEntity.size(); k++) {
                        UserImagesDto userImagesDto = new UserImagesDto();
                        userImagesDto.setName_images(userImagesEntity.get(k).getName_images());
                        userImagesDtos.add(userImagesDto);
                    }
                    userDetaisDto.setUserImages(userImagesDtos);
                    userDetaisDtos.add(userDetaisDto);
                }
            }
        }
        return userDetaisDtos;
    }
    // API get image
    @GetMapping("/get-image")
    public @ResponseBody List<UserImagesDto> getImage(){
        List<UserImagesEntity> userImagesEntities = customerUserDetailService.findAll();
        List<UserImagesDto> userImagesDtos = new ArrayList<>();
        for (int i = 0; i < userImagesEntities.size(); i++) {
            UserImagesDto userImagesDto = new UserImagesDto();
            userImagesDto.setId_account(userImagesEntities.get(i).getIdAccount());
            userImagesDto.setName_images(userImagesEntities.get(i).getName_images());
            userImagesDtos.add(userImagesDto);
        }
        return userImagesDtos;
    }


    @RequestMapping(value = "/change_password")
    @ResponseBody
    public Response changePass(@RequestBody ChangePassword changePassword) {
        return customerUserDetailService.changePass(changePassword);
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public Response createUser(@RequestBody UserAccountDto userAccountDto) {
        UserAccount userAccount = customerUserDetailService.saveUserAccount(userAccountDto);
        SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(userAccount, userAccount.getPassword(), userAccount.getAuthorities()));
        return new Response(1, userAccountDto);
    }

    // save-interested
//    @RequestMapping(value = "/save-interested", method = RequestMethod.POST, produces = "application/json")
//    public String saveInterested(InterestedDto interestedDto ){
//        customerUserDetailService.saveInterested(interestedDto);
//        return "redirect:encounters";
//    }

    @RequestMapping("/create_profile")
    @ResponseBody
    public Response createProfile(@RequestBody ProfileDto profileDto) {
        customerUserDetailService.saveUserDetails(profileDto);
        return new Response(1, profileDto);
    }

    @RequestMapping(value = "/create_images", method = RequestMethod.POST)
    @ResponseBody
    public Response createImages(@RequestBody UserImagesDto userImagesDto) throws IOException {
        customerUserDetailService.saveUserImage(userImagesDto);
        return new Response(1, userImagesDto);
    }

    @RequestMapping("/encounters")
    public String getEncounters(Model model, Principal principal) {
        model.addAttribute("title", "Mabel-Encounters");
        UserAccount userAccount = customerUserDetailService.findByEmail(principal.getName());
        UserImagesEntity userImagesEntity = customerUserDetailService.findFirstByIdAccount(userAccount.getId_account());
        model.addAttribute("userImage", userImagesEntity);
        return "/encounters";
    }

    @RequestMapping("/editprofile/{id}")
    public String editProfile(Model model, @PathVariable Long id, Principal principal) {
        model.addAttribute("title", "Mabel-Edit");
        UserDetailsEntities userDetailsEntity = customerUserDetailService.findFirstById_account(id);
        model.addAttribute("userDetailsEntities", userDetailsEntity);
        UserAccount userAccount = customerUserDetailService.findByEmail(principal.getName());
        UserImagesEntity userImagesEntity = customerUserDetailService.findFirstByIdAccount(userAccount.getId_account());
        model.addAttribute("userImage", userImagesEntity);
        return "/editprofile";
    }

    @RequestMapping("/profile")
    public String getProfile(Model model, Principal principal) {
        model.addAttribute("title", "Mabel-Profile");
        UserAccount userAccount = customerUserDetailService.findByEmail(principal.getName());
        UserImagesEntity userImagesEntity = customerUserDetailService.findFirstByIdAccount(userAccount.getId_account());
        model.addAttribute("userImage", userImagesEntity);
        return "/profile";
    }

    @RequestMapping("/liked-you")
    public String getLikedYou(Model model, Principal principal) {
        model.addAttribute("title", "Mabel-Liked you!");
        UserAccount userAccount = customerUserDetailService.findByEmail(principal.getName());
        UserImagesEntity userImagesEntity = customerUserDetailService.findFirstByIdAccount(userAccount.getId_account());
        model.addAttribute("userImage", userImagesEntity);
        return "/liked-you";
    }

    @RequestMapping("/message")
    public String getMessage(Model model, Principal principal) {
        model.addAttribute("title", "Mabel-Message");
        UserAccount userAccount = customerUserDetailService.findByEmail(principal.getName());
        UserImagesEntity userImagesEntity = customerUserDetailService.findFirstByIdAccount(userAccount.getId_account());
        model.addAttribute("userImage", userImagesEntity);
        return "/message";
    }
}
