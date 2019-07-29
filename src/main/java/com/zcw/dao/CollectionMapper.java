package com.zcw.dao;

import com.zcw.model.Collect;
import com.zcw.model.Project;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface CollectionMapper {
    Collect findByProjectIdAndUserId(@Param(value = "projectId") Integer projectId, @Param(value = "userId") Integer userId);

    void insertCollection(@Param(value = "projectId") Integer projectId, @Param(value = "userId") Integer userId);

    List<Project> findByUserId(Integer id);
}
