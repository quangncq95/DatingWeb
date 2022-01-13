package com.ncq.datingweb.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.List;

@Data
public class UserImagesDto implements Serializable {
    Long id_account;
    String name_images;
    List<FileImage> files;

    @Data
    public static class FileImage{
        String nameFile;
        String base64;
    }
}
