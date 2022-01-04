package com.ncq.datingweb.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class UserAccountDto implements Serializable {
    String email;
    String password;
}
