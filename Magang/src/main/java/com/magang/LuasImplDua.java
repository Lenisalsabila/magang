package com.magang;

import org.springframework.stereotype.Component;

@Component
public class LuasImplDua implements LuasService {

    @Override
    public double hitungLuas(double panjang, double lebar) {
        return (panjang*lebar)/2;
    }

    @Override
    public double hitungLuasDua() {
        return 0;
    }
}
