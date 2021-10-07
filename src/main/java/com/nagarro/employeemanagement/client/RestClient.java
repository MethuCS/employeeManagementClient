package com.nagarro.employeemanagement.client;

import com.nagarro.employeemanagement.entity.Employee;
import com.nagarro.employeemanagement.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Component
public class RestClient {
    RestTemplate restTemplate = new RestTemplate();
    private static final String GET_ALL_USERS_API = "http://localhost:8090/api/v1/users";
    private static final String GET_USER_BY_ID_API = "http://localhost:8090/api/v1/users/{id}";
    private static final String CREATE_USER_API = "http://localhost:8090/api/v1/users";
    private static final String UPDATE_USER_API = "http://localhost:8090/api/v1/users/{id}";
    private static final String DELETE_USER_BY_API = "http://localhost:8090/api/v1/users/{id}";


    private static final String BASE_EMPLOYEE_API = "http://localhost:8090/api/v1/employees";


    public void callPerson() {
        User user = restTemplate.getForObject(GET_USER_BY_ID_API, User.class);
        System.out.println(user.getUserName());

    }

    public User[] getAllUsers() {
        User[] list = restTemplate.getForObject(GET_ALL_USERS_API, User[].class);
        return list;
    }

    public Employee[] getAllEmployees() {
        System.out.println("before rest api");
        Employee[] list = restTemplate.getForObject(BASE_EMPLOYEE_API, Employee[].class);
        return list;
    }

    public void createEmployee(Employee employee) {
        Employee currentEmployee = restTemplate.postForObject(BASE_EMPLOYEE_API, employee, Employee.class);

    }

    public Employee getEmployeeById(Long id) {
        String GET_EMPLOYEE_BY_ID_API = BASE_EMPLOYEE_API + "/" + String.valueOf(id);
        System.out.println("get employee in client");
        System.out.println(GET_EMPLOYEE_BY_ID_API);
        return restTemplate.getForObject(GET_EMPLOYEE_BY_ID_API, Employee.class);
    }

    public void deleteEmployee(Long id) {
        String DELETE_EMPLOYEE_BY_API = BASE_EMPLOYEE_API + "/" + String.valueOf(id);
        System.out.println("delete in client");
        System.out.println(DELETE_EMPLOYEE_BY_API);
        restTemplate.delete(DELETE_EMPLOYEE_BY_API);
    }

    public void updateEmployee(Employee employee, Long id) {
        String UPDATE_EMPLOYEE_API = BASE_EMPLOYEE_API + "/" + String.valueOf(id);
        System.out.println("update in client");
        System.out.println(UPDATE_EMPLOYEE_API);
        restTemplate.put(UPDATE_EMPLOYEE_API, employee, Employee.class);
    }

    public boolean validateUser(String username, String password) {
        boolean val = false;
        User[] list = restTemplate.getForObject(GET_ALL_USERS_API, User[].class);
        for (User user : list) {
            if (user.getUserName().equals(username) && user.getPassword().equals(password)) {
                val = true;
                break;
            }
        }
        return val;

    }

}
