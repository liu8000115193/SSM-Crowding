package com.zcw.service.impl;

import com.zcw.dao.AccountMapper;
import com.zcw.model.Account;
import com.zcw.service.AccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {
    private Logger logger=LoggerFactory.getLogger(AccountServiceImpl.class);
    @Autowired
    private AccountMapper accountMapper;
    @Override
    public List<Account> getAccount(Integer id) {
        logger.info("get account by user id!");
        return accountMapper.findByUserId(id);
    }
}
