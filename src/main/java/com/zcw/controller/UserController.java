package com.zcw.controller;

import com.zcw.model.Comment;
import com.zcw.model.Order;
import com.zcw.model.ResultVO;
import com.zcw.model.Users;
import com.zcw.service.impl.UserServiceImpl;
import com.zcw.util.CheckUtil;
import com.zcw.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@SessionAttributes
public class UserController {
    @Autowired
    private UserServiceImpl userService;
    //忘记密码
    @RequestMapping("/loginRegister/forgetPassword")
    private String forgetPassword(@RequestParam(value = "loginname") String name,@RequestParam(value = "password") String password){
        userService.updetePassword(name,password);
        return "/login/login";
    }
    //查找信息
    @RequestMapping("/userInformation/{id}")
    private String userInformation(@PathVariable(value = "id") Integer id,Model model){
        model.addAttribute("users",userService.getUserInformation(id));
        return "user/user-information";
    }
    //登录
    @RequestMapping(value = "/loginRegister/login")
    public String login(@RequestParam(value = "name") String name,
                        @RequestParam(value = "password") String password,
                        Model model, HttpSession httpSession){
        Users users=userService.login(name,password);
        if (users==null)
            return "/login/login";
        else if (users.getIsadmin().equals("是")){
            model.addAttribute("user",users);
            httpSession.setAttribute("user",users);
            return "/manage/manage";
        }
        else {
            model.addAttribute("user",users);
            httpSession.setAttribute("user",users);
            return "forward:/hostProject";
        }
    }
    //注册
    @RequestMapping(value = "/loginRegister/insertUsers")
    public ResultVO insertUsers(@RequestBody Users users){
        return userService.insertUsers(users);
    }

//注销
    @RequestMapping("loginRegister/logoutLogin")
    public String logoutLogin(HttpSession httpSession){
        httpSession.invalidate();
        return "/login/login";
    }

//我的收益
    @RequestMapping("/userProfit/{id}")
    public String getUserProfit(@PathVariable(value = "id") Integer id,Model model){
        model.addAttribute("Profit",userService.getUserProfit(id));
         return "/user/user-profit";
    }
    //提现
    @RequestMapping("/withdrawMoney")
    @ResponseBody
    public ResultVO withdrawMoney(@RequestBody Users users){
        return userService.withDrawMoney(users);
    }
    //添加订单
    @RequestMapping("/user/addOrder")
    @ResponseBody
    public ResultVO addOrder(@RequestBody Order order){
        ResultVO resultVO = CheckUtil.checkOrder(order);
        if (resultVO.getCode()==1)
            return resultVO;
        return userService.addOrder(order);
    }

    @RequestMapping("/file/upload")
    @ResponseBody
    public ResultVO imageUpload(@RequestParam(value = "userImage") MultipartFile file,Users users,
                              HttpServletRequest request) throws IOException {
        ResultVO resultVO = new ResultVO();

        String rootPath = request.getSession().getServletContext().getRealPath("images/");
        String fileUrl = FileUpload.imageUpload(file,rootPath);
        users.setHeadimg(fileUrl);
//        userService.updateUserInformation(users);
        return userService.updateUserInformation(users);
    }
    //用户评论
    @RequestMapping("/commentUpload")
    @ResponseBody
    public ResultVO commentUpload(@RequestParam(value = "commentImage") MultipartFile file,Comment comment,
                                HttpServletRequest request) throws IOException {
        ResultVO resultVO = CheckUtil.checkComment(comment);
        if (resultVO.getCode()==1)
            return resultVO;
        String rootPath = request.getSession().getServletContext().getRealPath("images/");
        String fileUrl = FileUpload.imageUpload(file,rootPath);
        comment.setImages(fileUrl);
//        userService.updateUserInformation(users);
        return userService.insertComment(comment);
    }

}

