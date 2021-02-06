package com.amdevelopers.tms.services;

import com.amdevelopers.tms.database.User;
import java.util.List;

public interface UserService {

    boolean save(User user);

    boolean saveUserWithoutPassword(User user);

    User findByUserName(String username);

    List<User> findByStatus(String status);
}
