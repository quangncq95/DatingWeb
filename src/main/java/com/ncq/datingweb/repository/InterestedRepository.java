package com.ncq.datingweb.repository;

import com.ncq.datingweb.entities.InterestedEntities;
import com.ncq.datingweb.entities.UserImagesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InterestedRepository extends JpaRepository<InterestedEntities, Long> {
    public abstract List<InterestedEntities> findAllByIdAccount(Long id_account);
}
