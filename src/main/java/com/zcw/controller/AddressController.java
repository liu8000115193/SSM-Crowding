package com.zcw.controller;

import com.zcw.model.Address;
import com.zcw.service.impl.AddressServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AddressController {
    @Autowired
    private AddressServiceImpl addressService;

    @RequestMapping("/userAddress/{id}")
    public String getUserAdress(@PathVariable(value = "id") Integer id, Model model){
        model.addAttribute("listAddress",addressService.getAddress(id));
        return "user/user-address";
    }

    @RequestMapping("/addAddress")
    public String addAddress(Address address){
        addressService.addAddress(address);
//        attributes.addAttribute("id",address.getUserid());
        return "redirect:/userAddress/"+address.getUserid();
    }

    @RequestMapping("/delAddress/{userid}/{id}")
    public String deleteAddress(@PathVariable(value = "id") Integer id,
                                @PathVariable(value = "userid") Integer userid){
        addressService.deleteAddress(id);
        return "redirect:/userAddress/"+userid;
    }

    @RequestMapping("/deafultAddress/{userid}/{id}")
    public String deafultAddress(@PathVariable(value = "id") Integer id,
                                 @PathVariable(value = "userid") Integer userid){
        addressService.setDeafultAddress(userid,id);
        return "redirect:/userAddress/"+userid;
    }
    @RequestMapping("/updateAddress")
    public String updateAddress(Address address){
        addressService.updateAddress(address);
        return "redirect:/userAddress/"+address.getUserid();
    }
}
