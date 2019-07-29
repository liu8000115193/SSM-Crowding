package com.zcw.service;

import com.zcw.model.Address;

import java.util.List;

public interface AddressService {
    void addAddress(Address address);

    List<Address> getAddress(Integer id);

    void deleteAddress(Integer id);

    void setDeafultAddress(Integer userid,Integer id);

    void updateAddress(Address address);
}
