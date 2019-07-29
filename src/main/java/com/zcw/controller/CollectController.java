package com.zcw.controller;

import com.zcw.model.ResultVO;
import com.zcw.service.impl.CollectServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CollectController {
    @Autowired
    private CollectServiceImpl collectService;
    //收藏
    @RequestMapping(value = "/project/addCollect")
    @ResponseBody
    public ResultVO addCollect(@RequestParam(value = "projectId") Integer projectId, @RequestParam(value = "userId") Integer userId){
        return collectService.addCollects(projectId,userId);
    }
    @RequestMapping("/userCollect/{id}")
    public String getUserCollect(@PathVariable(value = "id") Integer id, Model model){
        model.addAttribute("collect",collectService.findByUserId(id));
        return "user/user-collect";
    }
}
