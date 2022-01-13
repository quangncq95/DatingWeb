package com.ncq.datingweb.service;

import com.ncq.datingweb.dto.*;
import com.ncq.datingweb.entities.UserAccount;
import com.ncq.datingweb.entities.UserDetailsEntities;
import com.ncq.datingweb.entities.UserImagesEntity;
import com.ncq.datingweb.repository.UserAccountRepository;
import com.ncq.datingweb.repository.UserDetailsRepository;
import com.ncq.datingweb.repository.UserImagesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import javax.transaction.Transactional;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CustomerUserDetailService implements UserDetailsService {

    @Autowired
    UserAccountRepository userAccountRepository;
    @Autowired
    UserDetailsRepository userDetailsRepository;
    @Autowired
    UserImagesRepository userImagesRepository;

    public UserAccount findByEmail(String email) {
        return userAccountRepository.findByEmail(email);
    }

    public UserDetailsEntities findFirstById_account(Long id_account) {
        return (UserDetailsEntities) userDetailsRepository.findFirstByIdAccount(id_account);
    }

    public List<UserDetailsEntities> findAllByGender(String gender){
        return userDetailsRepository.findAllByGender(gender);
    }

    public List<UserImagesEntity> findAll(){
        return  userImagesRepository.findAll();
    }

    public List<UserImagesEntity> findAllById_account(Long id_account){
        return  userImagesRepository.findAllByIdAccount(id_account);
    }

    public UserImagesEntity findFirstByIdAccount(Long id_account){
        return userImagesRepository.findFirstByIdAccount(id_account);
    }

    static String FOLDER = "D:\\img\\";

    public List<UserImagesEntity> saveUserImage(UserImagesDto userImagesDto) throws IOException {
        List<UserImagesEntity> userImagesEntities = new ArrayList<>();
        if (userImagesDto.getFiles() != null && userImagesDto.getFiles().size() > 0) {
            for (UserImagesDto.FileImage fileImage : userImagesDto.getFiles()) {
                UserImagesEntity userImagesEntity = new UserImagesEntity();
                userImagesEntity.setIdAccount(userImagesDto.getId_account());
                userImagesEntity.setName_images(fileImage.getNameFile());
                saveToFile(decodeToImage(fileImage.getBase64()), fileImage.getNameFile());
                userImagesRepository.save(userImagesEntity);
                userImagesEntities.add(userImagesEntity);
            }
        }
        return userImagesEntities;
    }

    public static void saveToFile(BufferedImage img, String nameFile) throws IOException {
        File outputfile = new File(FOLDER + nameFile);
        if (!outputfile.exists()){
            outputfile.createNewFile();
        }
        ImageIO.write(img, "png", outputfile);
    }

    public static BufferedImage decodeToImage(String imageString) {
        BufferedImage image = null;
        byte[] imageByte;
        try {
            BASE64Decoder decoder = new BASE64Decoder();
            imageByte = decoder.decodeBuffer(imageString.substring(imageString.indexOf(',') + 1));
            ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
            image = ImageIO.read(bis);
            bis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return image;
    }

//    public static String encodeToString(BufferedImage image, String type) {
//        String imageString = null;
//        ByteArrayOutputStream bos = new ByteArrayOutputStream();
//
//        try {
//            ImageIO.write(image, type, bos);
//            byte[] imageBytes = bos.toByteArray();
//
//            BASE64Encoder encoder = new BASE64Encoder();
//            imageString = encoder.encode(imageBytes);
//
//            bos.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return imageString;
//    }

    public UserAccount saveUserAccount(UserAccountDto userAccountDto) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        UserAccount userAccount = new UserAccount();
        userAccount.setEmail(userAccountDto.getEmail());
        userAccount.setPassword(passwordEncoder.encode(userAccountDto.getPassword()));
        return userAccountRepository.save(userAccount);
    }

    public UserDetailsEntities saveUserDetails(ProfileDto profileDto) {
        UserDetailsEntities userDetailsEntities = new UserDetailsEntities();
        userDetailsEntities.setIdAccount(profileDto.getId_account());
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
        if (passwordEncoder.matches(changePassword.getCurrent_password(), userAccount.getPassword())) {
            userAccountRepository.updatePasswork(userAccount.getId_account(), passwordEncoder.encode(changePassword.getNew_password()));
            response.setCode(0);
            response.setData("Successful change");
        } else {
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
