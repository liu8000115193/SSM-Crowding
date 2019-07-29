package com.zcw.service;

import com.zcw.model.Project;
import com.zcw.model.ResultVO;

import java.util.List;

public interface CollectService {
    ResultVO addCollects(Integer projectId, Integer userId);

    List<Project> findByUserId(Integer id);
}
