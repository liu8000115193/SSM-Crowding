package com.zcw.service;

import com.zcw.model.Kind;
import com.zcw.model.Project;
import com.zcw.model.ResultVO;
import com.zcw.model.Type;

import java.util.List;
import java.util.Map;

public interface ProjectService {
    public Map<String,Object> findHostProject();
//    public Project findById();
    public Map<String,Object> detailProject(Integer id);

    List<Project> findProjectByKeyword(String keyword);

    List<Project> findProjectByuserid(Integer id);

    ResultVO addProject(Project project);

    List<Kind> displayKind();

    List<Type> displayType();

    ResultVO sortProject(String sort, String state, Integer toPage, String keyword);

    Object userOrder(Integer pid, Integer uid);

    void addCollects(Integer projectId,Integer userId);

    List<Project> findProjectByAdmin();

    void shenHeProject(Integer id, String shenHe);

    void deleteproj(Integer id);

}
