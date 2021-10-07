package com.nagarro.employeemanagement.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;

@JsonIgnoreProperties({"hibernateLazyInitializer","handler"})
public class Employee implements Serializable {

    private Long employeeCode;

    private String employeeName;

    private String employeeLocation;

    private String email;

    private String dateOfBirth;

    public Employee() {
    }

    public Employee(String employeeName, String employeeLocation, String email, String dateOfBirth) {
        this.employeeName = employeeName;
        this.employeeLocation = employeeLocation;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
    }

    public Long getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(Long employeeCode) {
        this.employeeCode = employeeCode;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeLocation() {
        return employeeLocation;
    }

    public void setEmployeeLocation(String employeeLocation) {
        this.employeeLocation = employeeLocation;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
