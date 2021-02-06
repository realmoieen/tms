package com.amdevelopers.tms.services;

import com.amdevelopers.tms.TMSPasswordEncoder;
import com.amdevelopers.tms.database.User;
import com.amdevelopers.tms.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TMSPasswordEncoder tmsPassDecoder;

    @Override
    public boolean save(User user) {
        user.setPassword(tmsPassDecoder.encode(user.getPassword()));
        userRepository.save(user);
        return true;
    }

    @Override
    public boolean saveUserWithoutPassword(User user) {
        userRepository.save(user);
        return true;
    }

    @Override
    public User findByUserName(String username) {
        return userRepository.findByUserName(username);
    }

    @Override
    public List<User> findByStatus(String status) {
        return userRepository.findByStatus(status);
    }
}
