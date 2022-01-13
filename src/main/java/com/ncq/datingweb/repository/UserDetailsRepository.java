package com.ncq.datingweb.repository;

import com.ncq.datingweb.entities.UserDetailsEntities;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface UserDetailsRepository extends JpaRepository<UserDetailsEntities, Long> {
    UserDetailsEntities findFirstByIdAccount(Long id_account);
    List<UserDetailsEntities> findAllByGender(String gender);
}
