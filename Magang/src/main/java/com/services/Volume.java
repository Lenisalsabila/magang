package com.services;

import com.magang.LuasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Volume implements VolumeServices {

    @Autowired
    private LuasService luasService;

    @Override
    public double hitungvolume(double lebar,double panjang, double tinggi) {
        return luasService.hitungLuas(lebar,panjang) *tinggi;
    }
}
