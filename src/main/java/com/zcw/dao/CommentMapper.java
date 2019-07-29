package com.zcw.dao;

import com.zcw.model.Comment;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface CommentMapper {
    List<Comment> findCommentByProjectId(@Param("id") Integer id);

    void insertComment(@Param(value = "comment") Comment comment);
}