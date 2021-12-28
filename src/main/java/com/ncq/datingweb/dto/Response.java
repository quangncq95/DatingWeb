package com.ncq.datingweb.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

@Data
@AllArgsConstructor
public class Response implements Serializable {
    int code;
    Object data;

}
