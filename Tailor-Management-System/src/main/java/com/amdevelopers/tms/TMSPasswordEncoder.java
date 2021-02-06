/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 *
 * @author Moieen Abbas
 */
public class TMSPasswordEncoder implements PasswordEncoder {

    @Override
    public String encode(CharSequence rawPassword) {
        String hashedPassword = getHash(rawPassword.toString());
        return hashedPassword;
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        String hashedPassword = getHash(rawPassword.toString());
        if (hashedPassword.equals(encodedPassword)) {
            return true;
        } else {
            return false;
        }
    }

    private String getHash(String data) {
        byte[] digest = null;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            digest = messageDigest.digest(data.getBytes());
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return Base64.getEncoder().encodeToString(digest);
    }
    public static void main(String[] args){
            System.out.println(new TMSPasswordEncoder().encode("admin"));
    }
}
