package com.ncq.datingweb.repository;

import com.ncq.datingweb.entities.UserDetailsEntities;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public interface UserDetailsRepository extends JpaRepository<UserDetailsEntities,Long> {

}
