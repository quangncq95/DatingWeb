package com.ncq.datingweb.entities;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "user_details")
@Data
public class UserDetailsEntities implements Serializable {
    @Id
    @Column(name = "id_details")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id_details;
    @Column(name = "id_account")
    Long idAccount;
    @Column(name = "name")
    String name;
    @Column(name = "gender")
    String gender;
    @Column(name = "birthday")
    Date birthday;
    @Column(name = "city")
    String city;
    @Column(name = "introduce")
    String introduce;
    @Column(name = "education")
    String education;
    @Column(name = "career")
    String career;
}
