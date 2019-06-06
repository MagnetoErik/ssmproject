package com.magneto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pages")
public class PagesController {

    @RequestMapping("/empList")
    public String empList(){
        return "empList";
    }

    @RequestMapping("/home")
    public String home(){
        return "home";
    }

    @RequestMapping("/addEmp")
    public String addEmp(){
        return "addEmp";
    }
}
