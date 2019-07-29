package com.zcw.dao;

import com.zcw.model.Project;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ProjectMapper {
    public List<Project> findHostProject();
    public Project findById();
    public Project findProjectDeatilById(@Param("id") Integer id);

    public List<Project> findProjectByKeyword(@Param("keyword") String keyword);

    List<Project> findProjectByUserid(Integer id);

    void addProject(Project project);

    List<Project> sortProject(@Param("sort") String sort,@Param("state") String state,@Param("toPage") Integer toPage,@Param("keyword") String keyword);

    int getAllProject();

    List<Project> findAllProject();

    List<Project> findProjectByAdmin();

    void shenHeProject(@Param(value = "id") Integer id, @Param(value = "shenHe") String shenHe);

    void deleteProject(@Param("id") Integer id);
}