package com.ncq.datingweb.entities;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "interested")
@Data
public class InterestedEntities implements Serializable {
    @Id
    @Column(name = "id_interested")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long idInterested;
    @Column(name = "id_account")
    Long idAccount;
    @Column(name = "id_liked")
    Long idLiked;
}