package com.magang;

public class Luas {
    private double varPanjang, varLebar;

    //konstruktor =method yang tidak mempunyai  return value harus sama dengan nama kelas
    public Luas(double p,double l){
        this.varPanjang = p;
        this.varLebar = l;
    }

    //jika ada nilai balikan (double, int)butuh return kecuali void
    public double hitungLuas(double panjang, double lebar){
        return panjang*lebar;
    }
    public double hitungLuasDua(){
        return this.varPanjang * this.varLebar;
    }
}
