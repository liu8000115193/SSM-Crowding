package com.zcw.dao;

import com.zcw.model.Account;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface AccountMapper {

    List<Account> findByUserId(Integer id);

    void insert(@Param(value = "id") Integer id, @Param(value = "paypwd") String paypwd, @Param("paymoney") Double paymoney, @Param(value = "money") Double money);
}