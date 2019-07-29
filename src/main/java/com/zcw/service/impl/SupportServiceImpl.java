package com.zcw.service.impl;

import com.zcw.dao.SupportMapper;
import com.zcw.model.SupportVO;
import com.zcw.service.SupportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupportServiceImpl implements SupportService {
    @Autowired
    private SupportMapper supportMapper;
    @Override
    public List<SupportVO> findByUserId(Integer id) {
        List<SupportVO>list = supportMapper.findByUserId(id);
        for (SupportVO supportVO:list){
            supportVO.setProcess(supportVO.getSupmoney(),supportVO.getNeedmoney());
            supportVO.setDateTime(supportVO.getDeadline());
        }
        return list;
    }
}
