package com.amdevelopers.tms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return new TMSPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
//            web.ignoring().antMatchers("/customers/data");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //                .antMatchers("/resources/**", "/registration","/verify-email","/activateUser").permitAll()
        http.authorizeRequests()
                .antMatchers("/resources/**").permitAll()
                .anyRequest().authenticated()
        .and()
            .formLogin()
                .loginPage("/login")
                .usernameParameter("username")
                .permitAll()
        .and()
            .csrf().ignoringAntMatchers("/customers/data")
        .and()        
            .logout()
                .deleteCookies("JSESSIONID")
                .permitAll()
        .and()
            .rememberMe()
                .rememberMeParameter("rememberMe")
                .key("uniqueAndSecret")
                .tokenValiditySeconds(86400);
    }

    @Bean
    public AuthenticationManager customAuthenticationManager() throws Exception {
        return authenticationManager();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(getPasswordEncoder());
    }
}
