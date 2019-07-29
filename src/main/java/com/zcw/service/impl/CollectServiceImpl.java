package com.zcw.service.impl;

import com.zcw.dao.CollectionMapper;
import com.zcw.model.Collect;
import com.zcw.model.Project;
import com.zcw.model.ResultVO;
import com.zcw.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectServiceImpl implements CollectService {
    @Autowired
    private CollectionMapper collectionMapper;
    @Override
    public ResultVO addCollects(Integer projectId, Integer userId) {
        ResultVO resultVO = new ResultVO();
        Collect collection = collectionMapper.findByProjectIdAndUserId(projectId,userId);
        if (collection==null){
            collectionMapper.insertCollection(projectId,userId);
            return resultVO.success(0,"收藏成功");
        }
        else
            return resultVO.success(collection,"已收藏");
    }

    @Override
    public List<Project> findByUserId(Integer id) {
        List<Project> list = collectionMapper.findByUserId(id);
        return list;
    }
}
