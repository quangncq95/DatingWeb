package com.ncq.datingweb.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class ProfileDto implements Serializable {
    Long id_account;
    String name;
    String gender;
    Date birthday;
    String city;
    String introduce;
    String education;
    String career;
}
