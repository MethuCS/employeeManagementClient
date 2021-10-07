package com.nagarro.employeemanagement.controller;

import com.nagarro.employeemanagement.client.RestClient;
import com.nagarro.employeemanagement.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
    @Autowired
    RestClient restClient;


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String init(Model model) {
        model.addAttribute("msg", "Please Enter Your Login Details");
        return "login";
    }

    @RequestMapping(value = "/loggedIn", method = RequestMethod.POST)
    public String submit(Model model, @ModelAttribute("user") User user) {
        if (user != null && user.getUserName() != null & user.getPassword() != null) {
            String username = user.getUserName();
            String password = user.getPassword();

            boolean val = restClient.validateUser(username,password);
            if (val) {
                model.addAttribute("user", user.getUserName());
                return "redirect:/employee/list";
            } else {
                model.addAttribute("error", "Invalid Details");
                return "login";
            }
        } else {
            model.addAttribute("error", "Please enter Details");
            return "login";
        }
    }

}
