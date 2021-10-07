package com.nagarro.employeemanagement.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
//import org.springframework.jdbc.datasource.DriverManagerDataSource;
//import org.springframework.orm.hibernate5.HibernateTransactionManager;
//import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
//import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.client.RestTemplate;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * Hibernate configuration
 */
@Configuration
public class AppContext {


    @Bean
    public RestTemplate getRestTemplate(){
        return new RestTemplate();
    }

}
