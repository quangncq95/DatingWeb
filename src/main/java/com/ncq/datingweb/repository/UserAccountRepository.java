package com.ncq.datingweb.repository;

import com.ncq.datingweb.entities.UserAccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public interface UserAccountRepository extends JpaRepository<UserAccount, Long> {
    UserAccount findByEmail(String email);

    @Modifying
    @Query("update UserAccount u set u.password=?2 where u.id_account=?1")
    void updatePasswork(Long id, String passwordEncoded);
}
