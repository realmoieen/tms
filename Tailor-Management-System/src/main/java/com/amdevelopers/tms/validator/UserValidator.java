package com.amdevelopers.tms.validator;

import com.amdevelopers.logger.ConsoleLogger;
import com.amdevelopers.tms.database.User;
import com.amdevelopers.tms.services.UserService;
import java.util.List;
import java.util.Set;
import javax.validation.ConstraintViolation;
import org.slf4j.helpers.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

@Component
public class UserValidator extends BeanValidator {

    private ConsoleLogger logger = new ConsoleLogger(this.getClass());

    public UserValidator() {
        super();
    }
    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object userObject, Errors errors) {
        User user = (User) userObject;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "NotEmpty");

        User findByEmail = userService.findByUserName(user.getUserName());
        if (findByEmail != null) {
            logger.logDebug(user.getUserName()+ " is already registered in system");
            errors.rejectValue("userName", "Duplicate.userForm.email");
        }
        Set<ConstraintViolation<User>> violations = super.getValidator().validate(user);
        violations.stream().map((violation) -> {
            errors.rejectValue(violation.getPropertyPath().toString(), violation.getMessage());
            return violation;
        }).forEachOrdered((violation) -> {
            System.out.println(violation.getMessage());
        });
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 10 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }

    }

    public void validateEditProfile(Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");
        ValidationUtils.rejectIfEmpty(errors, "company", "NotEmpty");
        ValidationUtils.rejectIfEmpty(errors, "country", "NotEmpty");

    }

    public void postValidate(Object object, Errors errors) {
        User user = (User) object;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 10 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
    }
}
