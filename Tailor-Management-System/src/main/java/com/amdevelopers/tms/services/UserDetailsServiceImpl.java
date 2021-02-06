package com.amdevelopers.tms.services;

import com.amdevelopers.tms.database.User;
import com.amdevelopers.tms.exceptions.UserNotActiveException;
import com.amdevelopers.tms.repositories.UserRepository;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;


    @Override
//    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String userName) {
        HttpSession servletReqAttributes = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
        User currentlyLoggedUser = userRepository.findByUserName(userName);

        if (currentlyLoggedUser == null) {
            servletReqAttributes.setAttribute("login_error", "User name is not valid");
            throw new UsernameNotFoundException(userName);
        }
        if (!currentlyLoggedUser.getStatus().equals(User.ACTIVE)) {
            servletReqAttributes.setAttribute("login_error", "User is not active");
            throw new UserNotActiveException(userName + " is not active");
        }
        servletReqAttributes.setAttribute("userName", currentlyLoggedUser.getUserName());
        servletReqAttributes.setAttribute("friendlyName", currentlyLoggedUser.getFriendlyName());
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority("User"));
        return new org.springframework.security.core.userdetails.User(currentlyLoggedUser.getUserName(), currentlyLoggedUser.getPassword(), grantedAuthorities);
    }

    /**
     * This return currently logged in User Friendly Name
     *
     * @return logged user Email
     */
    public static String findLoggedInUserFriendlyName() {
        HttpSession servletReqAttributes = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
        String userName = (String) servletReqAttributes.getAttribute("friendlyName");
        return userName;
    }

    /**
     * This return currently logged in User Name
     *
     * @return logged user Email
     */
    public static String findLoggedInUserName() {
        HttpSession servletReqAttributes = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
        String userName = (String) servletReqAttributes.getAttribute("userName");
        return userName;
    }
}
