package com.amdevelopers.tms.repositories;

import com.amdevelopers.tms.database.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserName(String username);
    List<User> findByStatus(String status);
}
