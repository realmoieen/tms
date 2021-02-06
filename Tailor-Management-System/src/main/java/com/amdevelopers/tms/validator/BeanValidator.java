/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.validator;

import javax.validation.Validation;
import javax.validation.ValidatorFactory;
import org.springframework.validation.Validator;

/**
 *
 * @author Moieen Abbas
 */
public abstract class BeanValidator implements Validator {

    private final javax.validation.Validator validator;

    public BeanValidator() {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        validator = factory.getValidator();
    }
    public javax.validation.Validator getValidator(){
        return validator;
    }
}
