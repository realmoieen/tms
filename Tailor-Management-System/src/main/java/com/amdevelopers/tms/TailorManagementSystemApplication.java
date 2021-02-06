package com.amdevelopers.tms;

import com.amdevelopers.logger.ConsoleLogger;
import java.io.IOException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.data.jpa.datatables.repository.DataTablesRepositoryFactoryBean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(repositoryFactoryBeanClass = DataTablesRepositoryFactoryBean.class)
public class TailorManagementSystemApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(TailorManagementSystemApplication.class);
    }

    public static void main(String[] args) {
        try {
            ConsoleLogger.loadConfiguration("log4.json");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        SpringApplication.run(TailorManagementSystemApplication.class, args);
    }

}
