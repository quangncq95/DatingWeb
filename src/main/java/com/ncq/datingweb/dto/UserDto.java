package com.ncq.datingweb.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class UserDto implements Serializable {
    String name;
    Date bday;
    String gender;
    String location;
    String email;
    String password;
}
