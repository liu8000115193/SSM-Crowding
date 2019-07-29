package com.zcw.service.impl;

import com.zcw.dao.*;
import com.zcw.model.*;
import com.zcw.service.UserService;
import com.zcw.util.ShareCodeUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {
    private Logger logger=LoggerFactory.getLogger(UserServiceImpl.class);
    @Autowired
    private UsersMapper usersMapper;
    @Autowired
    private AccountMapper accountMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private SupportMapper supportMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Override
    public Users getUserInformation(Integer id) {
        logger.info("display user information");
        Users users=new Users();
        String code;
        ShareCodeUtil shareCodeUtil = new ShareCodeUtil();
        try{
            users=usersMapper.findUserById(id);

            if (users.getShareCode() == null){
                code = ShareCodeUtil.idToCode(users.getId());
                users.setShareCode(code);
                usersMapper.updateShareCode(code);
            }
            logger.info("find user information success");
        }catch (Exception e){
            logger.info(e+"find user information success fail");
        }
        return users;
    }
    public Users login(String name,String password) {
        return usersMapper.findByName(name,password);
    }

    @Override
    public ResultVO insertUsers(Users users) {
        logger.info("register");
        ResultVO resultVO=new ResultVO();
        List<Users> list=usersMapper.getPhoneAndEmail(users.getPhone(),users.getEmail());
        if (list.size()>0){
            resultVO.setCode(1);
            resultVO.setMsg("register error,aleadry has this user");
            return resultVO;
        }
        try {
            usersMapper.insertUsers(users);
            resultVO.setCode(0);
            resultVO.setMsg("success");
        }catch (Exception e){
            resultVO.setCode(1);
            resultVO.setMsg("resigter error,please repleat later!");
        }
        return resultVO;
    }

    @Override
    public ResultVO withDrawMoney(Users users) {
        logger.info("用户提现");
        ResultVO resultVO=new ResultVO();
        Double money;
        Users u=usersMapper.findUserByIdAndCard(users.getId(),users.getIdcard(),users.getPaypwd());
        if (u==null||u.getPaymoney()==null||u.getPaypwd()==null||users.getPaymoney()-u.getPaymoney()>0){
            logger.info("withdrawMoney failed");
            resultVO.setCode(1);
            resultVO.setMsg("withdrawMoney failed!");
            return resultVO;
        }
        try{
            money=u.getPaymoney()-users.getPaymoney();
            usersMapper.updatePayMoney(users.getPaymoney());
            accountMapper.insert(users.getId(),users.getPaypwd(),users.getPaymoney(),money);
            resultVO.setCode(0);
            resultVO.setData(users);
            resultVO.setMsg("withdrawMoney success!");
            logger.info("withdrawMoney success");
            return resultVO;
        }catch (Exception e){
            logger.info(e+"withdrawMoney failed!");
            resultVO.setCode(1);
            resultVO.setData(users);
            resultVO.setMsg(e+"withdrawMoney failed!");
            return resultVO;
        }
    }

    @Override
    public ResultVO addOrder(Order order) {
        logger.info("add Order");
        ResultVO resultVO = new ResultVO();
        Users users = new Users();
        Integer code = 0;
        if (!order.getInvitecode().equals("111111")) {
            code = ShareCodeUtil.codeToId(order.getInvitecode());
            users = usersMapper.findUserById(code);
            if (users==null||!users.getShareCode().equals(order.getInvitecode())){
                return resultVO.error("邀请码无效");
            }
            if (code==users.getId()&&users.getShareCode().equals(order.getInvitecode())){
                return resultVO.error("请输入他人邀请码！");
            }
        }
        try{
            users = usersMapper.findUserById(order.getUserid());
            if (users.getPaymoney()<order.getPaymoney()||users.getPaymoney()==null)
                return ResultVO.error("账户余额不足");
            orderMapper.insertOrder(order,code);
            logger.info("add Order success!");
            resultVO.success(order,"success");
        }catch (Exception e){
            logger.info(e+"add Order failed!");
            resultVO.error(e+"add Order failed!");
            return resultVO;
        }
        return resultVO;
    }
/*
查询我的收益
 */
    @Override
    public List<Profit> getUserProfit(Integer id) {
        ResultVO resultVO = new ResultVO();
        List<Profit> list = supportMapper.findProfitByUserId(id);
        List<Integer> userId = list.stream().map(Profit::getUserid).collect(Collectors.toList());
        for (Profit a : list) {
            Profit b=supportMapper.findProfitByUserIds(a.getUserid(),a.getProjectid());
            a.setSecondMoney(b.getSecondMoney());
            a.setSecondPeople(b.getSecondPeople());
            a.setProcess(a.getSupmoney(),a.getNeedmoney());
            a.setDateTime(a.getDeadline());
        }
//        for ()
        return list;
    }

    @Override
    public void updetePassword(String name, String password) {
        logger.info("找回密码！");
        Users users = usersMapper.findByLoginName(name);
        if (users!=null)
            usersMapper.updatePassword(name,password);
        else
            logger.info("没有此用户！");
    }
//显示所有用户
    @Override
    public List<Users> displayAlluser() {
        return usersMapper.displayAlluser();
    }
    //禁用用户
    @Override
    public void forbidUser(Integer id, String forbid) {
        usersMapper.updateUser(id,forbid);
    }

    @Override
    public void ableAdd(Integer id, String isAble) {
        usersMapper.updateUserByIsAble(id,isAble);
    }

    //修改用户信息
    @Override
    public ResultVO updateUserInformation(Users users) {
        ResultVO resultVO= new ResultVO();
        usersMapper.updateUserInformation(users);
        return resultVO.success();
    }

    //新增评论
    @Override
    public ResultVO insertComment(Comment comment) {
        ResultVO resultVO= new ResultVO();
        commentMapper.insertComment(comment);
        return resultVO.success();
    }
}
