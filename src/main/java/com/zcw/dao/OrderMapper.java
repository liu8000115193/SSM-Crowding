package com.zcw.dao;

import com.zcw.model.Order;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface OrderMapper {

    void insertOrder(@Param(value = "order") Order order,@Param(value = "code") Integer code);
}