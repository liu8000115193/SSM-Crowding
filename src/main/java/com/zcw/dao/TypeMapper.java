package com.zcw.dao;

import com.zcw.model.Type;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TypeMapper {
    List<Type> findType();
}