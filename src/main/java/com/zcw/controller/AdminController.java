package com.zcw.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zcw.model.Project;
import com.zcw.model.Users;
import com.zcw.service.ProjectService;
import com.zcw.service.impl.ProjectServiceImpl;
import com.zcw.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private ProjectServiceImpl projectService;
    @Autowired
    private UserServiceImpl userService;
    @RequestMapping(value = "/displayAllproj")
    public String displayAllproj(@RequestParam(required = false, defaultValue = "1") int pageNo,
                                 @RequestParam(required = false, defaultValue = "5") int pageSize,
                                 Model model){
        //开始分页，分页参数是页码和每页记录数
        PageHelper.startPage(pageNo, pageSize);
        List<Project> projectList = projectService.findProjectByAdmin();
        //对象列表传入页面
        PageInfo<Project> pageInfo = new PageInfo<Project>(projectList);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("allproj", projectList);
        return "/manage/manage-project";
    }
    @RequestMapping(value = "/projshenhe")
    public String projshenhe(@RequestParam(value = "pid") Integer id,@RequestParam(value = "shenHe") String shenHe){
        projectService.shenHeProject(id,shenHe);
        return "forward:/displayAllproj";
    }

    @RequestMapping(value = "/displayAlluser")
    public String displayAlluser(@RequestParam(required = false, defaultValue = "1") int pageNo,
                                 @RequestParam(required = false, defaultValue = "10") int pageSize,
                                 Model model) {
        //开始分页，分页参数是页码和每页记录数
        PageHelper.startPage(pageNo, pageSize);
        List<Users> usersList = userService.displayAlluser();
        //对象列表传入页面
        PageInfo<Users> pageInfo = new PageInfo<Users>(usersList);

        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("alluser", usersList);
        return "/manage/manage-member";
    }
    @RequestMapping(value = "/userForbid")
    public String userForbid(@RequestParam(value = "uid") Integer id,@RequestParam(value = "forbid") String forbid){
        userService.forbidUser(id,forbid);
        return "forward:/displayAlluser";
    }
    @RequestMapping(value = "/ableAddProject")
    public String ableAdd(@RequestParam(value = "uid") Integer id,@RequestParam(value = "isAble") String isAble){
        userService.ableAdd(id,isAble);
        return "forward:/displayAlluser";
    }
    @RequestMapping(value = "/deleteproj")
    public String deleteproj(@RequestParam(value = "pid") Integer pid){
        projectService.deleteproj(pid);
        return "forward:/displayAllproj";
    }

}
