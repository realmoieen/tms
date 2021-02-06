package com.amdevelopers.tms.controller.users;

import com.amdevelopers.logger.ConsoleLogger;
import com.amdevelopers.tms.services.UserService;
import com.amdevelopers.tms.validator.UserValidator;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class UserController {

    private ConsoleLogger logger = new ConsoleLogger(this.getClass());

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

//    @Autowired
//    SecurityServiceImpl securityServiceImpl;
    @GetMapping("/login")
    public String login(Model model, String logout) {
        HttpSession servletReqAttributes = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
        if (logout != null) {
            logger.logInfo("user logout");
            model.addAttribute("message", "You have been logged out successfully.");
        } else {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();

            if (!(auth instanceof AnonymousAuthenticationToken)) {

                /* The user is logged in :) */
                return "forward:/dashboard";
            }
            Object login_error = servletReqAttributes.getAttribute("login_error");
            if (login_error != null && !((String) login_error).isEmpty()) {
                model.addAttribute("error", login_error);
                servletReqAttributes.removeAttribute("login_error");
            } else {
                login_error = servletReqAttributes.getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
                if (login_error != null && login_error instanceof BadCredentialsException) {
                    model.addAttribute("bad_credential", ((BadCredentialsException) login_error).getMessage());
                    servletReqAttributes.removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");
                }
            }
        }

        return "userpages/login";
    }

    @GetMapping({"/", "/dashboard", "/dashboard/index"})
    public String welcome(Model model) {
        return "redirect:/dashboard/";
    }

//    @GetMapping("/forgetPassword")
//    public String forgetPassword(Model model) {
//        model.addAttribute("email", new String());
//        return "userpages/forgetPassword";
//    }
//
//    @PostMapping("/forgetPassword")
//    public String forgetPassword(@ModelAttribute("email") String email, BindingResult bindingResult, Model model) {
//        String result = resendEmail(email, model);
//        model.addAttribute("message", "Check your email to change password.");
//        return result;
//    }
}
