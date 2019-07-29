package com.zcw.dao;

import com.zcw.model.Profit;
import com.zcw.model.Project;
import com.zcw.model.Support;

import java.util.List;

import com.zcw.model.SupportVO;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface SupportMapper {
    List<Profit> findProfitByUserId(@Param(value = "shareId") Integer id);

    List<SupportVO> findByUserId(@Param(value = "id") Integer id);

    List<Profit> findProfitByUserIds(@Param(value = "userId") List<Integer> userId);

    Profit findProfitByUserIds(@Param(value = "userId") Integer userId, @Param(value = "projectId") Integer projectId);
}