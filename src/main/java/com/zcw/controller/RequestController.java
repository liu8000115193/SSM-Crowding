package com.zcw.controller;

import com.zcw.service.impl.ProjectServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class RequestController {
    @Autowired
    private ProjectServiceImpl projectService;
    @RequestMapping(value = "/returnRegister")
    public String returnRegister(){
        return "/login/register";
    }
    @RequestMapping(value = "/returnLogin")
    public String returnLogin(){
        return "/login/login";
    }
    @RequestMapping(value = "/returnIndex")
    public String returnIndex(){
        return "forward:/hostProject";
    }
    @RequestMapping(value = "/toContractProject")
    public String returnProjectStart(Model model){
        model.addAttribute("kinds",projectService.displayKind());
        model.addAttribute("types",projectService.displayType());
        return "/user/project-start";
    }
    @RequestMapping(value = "/scanProject")
    public String scanProject(){
        return "/user/project-scan";
    }
    @RequestMapping(value = "/loginRegister/register")
    public String register(){
        return "/login/register";
    }
    @RequestMapping(value = "/returnForgetPassword")
    public String forget(){
        return "/login/forgetPassword";
    }
    @RequestMapping(value = "/to_helpUtil")
    public String help(){
        return "/user/help";
    }
    @RequestMapping(value = "/helpUs")
    public String helpUs(){
        return "/help/help_about_us";
    }
    @RequestMapping(value = "/helpCourse")
    public String helpCourse(){
        return "/help/help_course";
    }
    @RequestMapping(value = "/helpProblem")
    public String helpProblem(){
        return "/help/help_problem";
    }
    @RequestMapping(value = "/helpRule")
    public String helpRule(){
        return "/help/help_rule";
    }
    @RequestMapping(value = "/helpService")
    public String helpService(){
        return "/help/help_service";
    }


}
