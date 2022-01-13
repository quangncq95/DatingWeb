package com.ncq.datingweb.entities;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "user_images")
@Data
public class UserImagesEntity implements Serializable {
    @Id
    @Column(name = "id_images")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id_images;
    @Column(name = "id_account")
    Long idAccount;
    @Column(name = "name_images")
    String name_images;
}
