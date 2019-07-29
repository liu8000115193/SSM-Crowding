package com.zcw.controller;

import com.zcw.service.impl.AccountServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {
    @Autowired
    private AccountServiceImpl accountService;
    @RequestMapping("/userAccount/{id}")
    public String userAccount(@PathVariable(value = "id") Integer id, Model model){
        model.addAttribute("account",accountService.getAccount(id));
        return "user/user-account";
    }
}
