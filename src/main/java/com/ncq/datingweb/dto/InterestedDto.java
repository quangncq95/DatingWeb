package com.ncq.datingweb.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class InterestedDto implements Serializable {
    Long id_account;
    Long id_liked;
}