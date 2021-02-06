/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.validator;

import com.amdevelopers.logger.ConsoleLogger;
import com.amdevelopers.tms.database.Customer;
import com.amdevelopers.tms.database.dto.CustomerDTO;
import java.util.Set;
import javax.validation.ConstraintViolation;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

/**
 *
 * @author Moieen Abbas
 */
@Component
public class CustomerValidator extends BeanValidator {

    private ConsoleLogger logger = new ConsoleLogger(this.getClass());

    public CustomerValidator() {
        super();
    }

    @Override
    public boolean supports(Class<?> type) {
        return Customer.class.equals(type) || CustomerDTO.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Set<ConstraintViolation<Object>> violations;
        if (o instanceof Customer) {
            Customer cust = (Customer) o;
            violations = super.getValidator().validate(cust);

        } else {
            CustomerDTO cust = (CustomerDTO) o;
            violations = super.getValidator().validate(cust);
        }
        violations.stream().map((violation) -> {
            errors.rejectValue(violation.getPropertyPath().toString(), violation.getMessage());
            return violation;
        }).forEachOrdered((violation) -> {
            System.out.println(violation.getMessage());
        });
    }

}
