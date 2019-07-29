package com.zcw.service.impl;

import com.zcw.dao.AddressMapper;
import com.zcw.model.Address;
import com.zcw.service.AddressService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AddressServiceImpl implements AddressService {
    private Logger logger=LoggerFactory.getLogger(AddressServiceImpl.class);
    @Autowired
    private AddressMapper addressMapper;

    @Override
    public void addAddress(Address address) {
        logger.info("add Address!");
        addressMapper.insertAddress(address);
    }

    @Override
    public List<Address> getAddress(Integer id) {
        logger.info("find Address by user id!");
        return addressMapper.findAddressByUserid(id);
    }

    @Override
    public void deleteAddress(Integer id) {
        logger.info("delete Address by id!");
        addressMapper.deleteAddress(id);
    }

    @Override
    public void setDeafultAddress(Integer userid,Integer id) {
        logger.info("Set default address!");
        List<Address> addresses = getAddress(userid);
        List<Address> deafult = addresses.stream().filter(address -> address.getIsdefault().equals("是")).collect(Collectors.toList());
        if (deafult.size()>0)
            addressMapper.setNotDeafultAddress(deafult.get(0).getId());
        addressMapper.setDeafultAddress(id);
    }

    @Override
    public void updateAddress(Address address) {
        logger.info("update Address by id!");
        addressMapper.updateAddress(address);
    }

}
