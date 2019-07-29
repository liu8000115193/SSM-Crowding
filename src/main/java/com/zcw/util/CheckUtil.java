package com.zcw.util;

import com.zcw.model.Comment;
import com.zcw.model.Order;
import com.zcw.model.Project;
import com.zcw.model.ResultVO;

import java.util.regex.Pattern;

public class CheckUtil {
    private static String ISEMAIL="^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$";

    private static String ISPHONE="^(13[0-9]|15[0-9]|153|15[6-9]|180|18[23]|18[5-9])\\d{8}$";

    private static String ISPASSWORD="";

//    public static boolean checkEmail(String expr){
//        if (expr.equals(null))
//            return false;
////        return Pattern.compile(ISEMAIL);
//    }
    //支付校验
    public static ResultVO checkOrder(Order order){
        ResultVO resultVO = new ResultVO();
        if (order.getUserid()==null)
            return resultVO.error("支付失败，请先登录");
        if (order.getInvitecode().length()!=6||order.getInvitecode()==null||order.getInvitecode().equals(""))
            return resultVO.error("邀请码错误");
        if (order.getAddressid()==null)
            return resultVO.error("请输入地址");
        if (order.getPaytype()==null)
            return resultVO.error("请选择支付方式");
        return resultVO.success();
    }
    //添加项目校验
    public static ResultVO checkProject(Project project) {
        ResultVO resultVO = new ResultVO();
        if (project.getUserid()==null)
            return resultVO.error("添加项目失败，请先登录");
        if (project.getTypeid()==null)
            return resultVO.error("添加项目失败，请选择项目类型");
        if (project.getKindid()==null)
            return resultVO.error("添加项目失败，请选择项目类别");
        if (project.getNeedmoney()==null||project.getName().equals(""))
            return resultVO.error("添加项目失败，请输入需要筹集金额");
        if (project.getIntroduce()==null||project.getIntroduce().equals(""))
            return resultVO.error("添加项目失败，请输入项目介绍");
        if (project.getName()==null||project.getName().equals(""))
            return resultVO.error("添加项目失败，请输入项目名称");
        if (project.getDeadline()==null||project.getName().equals(""))
            return resultVO.error("添加项目失败，请输入众筹结束时间");
        if (project.getBackcontent()==null||project.getName().equals(""))
            return resultVO.error("添加项目失败，请输入项目回报");
        if (project.getRule()==null||project.getRule().equals(""))
            return resultVO.error("添加项目失败，请输入项目规则");
        if (project.getBacktime()==null)
            return resultVO.error("添加项目失败，请输入项目回报时间");
        if (project.getSendmoney()==null)
            return resultVO.error("添加项目失败，请输入项目回报运费");
        return resultVO.success();
    }

    public static ResultVO checkComment(Comment comment) {
        ResultVO resultVO = new ResultVO();
        if (comment.getUserid()==null)
            return resultVO.error("添加评论失败，请先登录");
        if (comment.getProjectid()==null)
            return resultVO.error("添加评论失败，请选择评论项目");
        if (comment.getContent()==null||comment.getContent().equals(""))
            return resultVO.error("添加评论失败，请输入评论内容");
        return resultVO.success();
    }
}
