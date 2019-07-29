package com.zcw.dao;

import com.zcw.model.Users;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface UsersMapper {
    public Users findByName(@Param(value = "name") String name,@Param(value = "password") String password);
    public void insertUsers(@Param(value = "users") Users users);
    public List<Users> getPhoneAndEmail(@Param(value = "phone") String phone,
                                        @Param(value = "email") String email);
    Users findUserById(@Param(value = "id") Integer id);

    Users findUserByPhone(@Param(value = "phone") String phone);

    void updatePayMoney(@Param(value = "paymoney") Double paymoney);

    Users findUserByIdAndCard(@Param(value = "id") Integer id, @Param(value = "idcard") String idcard, @Param(value = "paypwd") String paypwd);

    void updateShareCode(@Param(value = "code") String code);

    Users findByLoginName(@Param(value = "name") String name);

    void updatePassword(@Param(value = "name") String name, @Param(value = "password") String password);

    List<Users> displayAlluser();

    void updateUser(@Param(value = "id") Integer id, @Param(value = "forbid") String forbid);

    void updateUserByIsAble(@Param(value = "id") Integer id, @Param(value = "isAble") String isAble);

    void updateUserInformation(@Param(value = "users") Users users);
}