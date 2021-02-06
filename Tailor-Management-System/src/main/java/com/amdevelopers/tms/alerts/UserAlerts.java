package com.amdevelopers.tms.alerts;

import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Moieen Abbas
 */
public class UserAlerts {

    public static String NOTICE = "NOTICE";
    public static String ERROR = "ERROR";

    public static void addAlert(String alertType, String message) {
        HttpSession servletReqAttributes = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
        servletReqAttributes.setAttribute(alertType, message);
    }
}
