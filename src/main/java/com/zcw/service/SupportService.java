package com.zcw.service;

import com.zcw.model.SupportVO;

import java.util.List;

public interface SupportService {
    List<SupportVO> findByUserId(Integer id);
}
