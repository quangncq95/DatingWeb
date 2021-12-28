package com.ncq.datingweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EntityScan("com.ncq.datingweb.entities")
@EnableJpaRepositories("com.ncq.datingweb.repository")
@EnableTransactionManagement
public class DatingWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(DatingWebApplication.class, args);
    }

}
