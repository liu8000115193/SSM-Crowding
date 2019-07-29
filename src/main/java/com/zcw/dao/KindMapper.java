package com.zcw.dao;

import com.zcw.model.Kind;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface KindMapper {

    List<Kind> findKind();
}