package com.nagarro.employeemanagement.controller;

import com.nagarro.employeemanagement.client.RestClient;
import com.nagarro.employeemanagement.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    RestClient restClient;

    @GetMapping("/list")
    public String listEmployees(Model theModel) {
        System.out.println("list called");
        Employee [] employees = restClient.getAllEmployees();
        theModel.addAttribute("employees", employees);
        return "employee-list";
    }

    @GetMapping("/showForm")
    public String showFormForAdd(Model theModel) {
        Employee employee = new Employee();
        theModel.addAttribute("employee", employee);
        return "employee-form";
    }

    @PostMapping("/saveEmployee")
    public String saveCustomer(@ModelAttribute("customer") Employee employee) {
        restClient.createEmployee(employee);
        return "redirect:/employee/list";
    }

    @GetMapping("/update")
    public String showFormForUpdate(@RequestParam("employeeCode") Long id,
                                    Model theModel) {
        System.out.println(" the id" + id);
        Employee employee = restClient.getEmployeeById(id);
        restClient.updateEmployee(employee,id);
        theModel.addAttribute("employee", employee);
        return "employee-form";
    }

    @GetMapping("/delete")
    public String deleteEmployee(@RequestParam("employeeCode") Long id) {
        restClient.deleteEmployee(id);
        return "redirect:/employee/list";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(){
        return "redirect:/login";
    }
}
