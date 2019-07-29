package com.zcw.controller;

import com.zcw.service.SupportService;
import com.zcw.service.impl.SupportServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SupportController {
    @Autowired
    private SupportServiceImpl supportService;
    @RequestMapping("/userSupport/{id}")
    public String getUserSupport(@PathVariable(value = "id") Integer id, Model model){
        model.addAttribute("support",supportService.findByUserId(id));
        return "user/user-support";
    }
}
