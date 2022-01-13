package com.ncq.datingweb.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class UserDetaisDto implements Serializable {
    Long id_account;
    String name;
    String gender;
    Date birthday;
    String city;
    String introduce;
    String education;
    String career;

    List<UserImagesDto> userImages;
}
