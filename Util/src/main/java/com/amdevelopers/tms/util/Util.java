/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Moieen Abbas
 */
public class Util {

    public static String formatDateToString(Date adate) {
        if (adate == null) {
            return null;
        }
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
        String strDate = dateFormat.format(adate);
        return strDate;
    }

    public static boolean isNullOrEmpty(Object obj) {
        return obj == null || obj.equals("");
    }

    public static boolean isNullOrEmpty(String str) {
        return str == null || str.equals("");
    }
}
