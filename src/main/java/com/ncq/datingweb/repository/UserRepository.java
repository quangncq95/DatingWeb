package com.ncq.datingweb.repository;

import com.ncq.datingweb.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);

    //cập nhật pass qua câu lệnh sql
    @Modifying
    @Query("update User u set u.password=?2 where u.id=?1")
    void updatePasswork(Long id, String passwordEncoded);
}