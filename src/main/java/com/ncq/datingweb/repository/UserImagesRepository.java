package com.ncq.datingweb.repository;

import com.ncq.datingweb.entities.UserDetailsEntities;
import com.ncq.datingweb.entities.UserImagesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserImagesRepository extends JpaRepository<UserImagesEntity, Long> {
    public abstract List<UserImagesEntity> findAllByIdAccount(Long id_account);
    public abstract List<UserImagesEntity> findAll();
    UserImagesEntity findFirstByIdAccount(Long id_account);
}
