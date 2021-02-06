/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.exceptions;

import org.springframework.security.core.AuthenticationException;

/**
 *
 * @author Moieen Abbas
 */
public class UserNotActiveException extends AuthenticationException{
    
    public UserNotActiveException(String msg, Throwable t) {
        super(msg, t);
    }
    public UserNotActiveException(String msg) {
        super(msg);
    }
    
}
