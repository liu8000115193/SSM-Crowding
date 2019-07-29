package com.zcw.service;

import com.zcw.model.*;

import java.util.List;

public interface UserService {
    Users getUserInformation(Integer id);
    public Users login(String name,String password);
    public ResultVO insertUsers(Users users);

    ResultVO withDrawMoney(Users users);

    ResultVO addOrder(Order order);

    List<Profit> getUserProfit(Integer id);

    void updetePassword(String name, String password);

    List<Users> displayAlluser();

    void forbidUser(Integer id, String forbid);

    void ableAdd(Integer id, String isAble);

    ResultVO updateUserInformation(Users users);

    ResultVO insertComment(Comment comment);
}
