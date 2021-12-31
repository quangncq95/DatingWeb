package com.ncq.datingweb.dto;


import lombok.Data;

@Data
public class ChangePassword {
    String current_password;
    String new_password;
    String retype_new_password;
}
