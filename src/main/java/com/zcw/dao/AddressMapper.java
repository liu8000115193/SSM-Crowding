package com.zcw.dao;

import com.zcw.model.Address;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface AddressMapper {

    void insertAddress(Address address);

    List<Address> findAddressByUserid(Integer id);

    void deleteAddress(Integer id);

    void setDeafultAddress(Integer id);

    void setNotDeafultAddress(Integer id);

    void updateAddress(Address address);
}