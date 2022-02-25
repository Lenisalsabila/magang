package com.latihan;

import com.dao.MasterDataDao;
import com.facade.Konfigurasi;
import com.model.Departemen;
import com.services.VolumeServices;
import org.apache.logging.log4j.core.util.Assert;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

//class di awali huruf besar
public class MainKelas {

    // public bisa diakses dimana saja
    //tipe data buatan selalu diawal huruf besar con. String
    public String tes(String param, int nilai){
        return nilai+"==> "+param;
    }

    //tipe data primitef huruf nya kecil semua
    public int nilai(){
        return 0;
    }

    //method dan selalu di awali huruf kecil
    public static void main(String[] args) {
        //instansiasi proses create object
        MainKelas mainKelas = new MainKelas();
        //System.out.println(args[0] +" = " +args[1]);
      /* System.out.println("tes " +mainKelas.tes("parameter",10));

        Luas luas = new Luas(60, 32);
        System.out.println("Luas "+luas.hitungLuas(30, 50));
        System.out.println("luas dua "+luas.hitungLuasDua());

        LuasService luasService = new LuasImpl();
        System.out.println("Luas Luas Service "+luasService.hitungLuas(23,50));
       */

        AnnotationConfigApplicationContext ctx =
                new AnnotationConfigApplicationContext();
        ctx.register(Konfigurasi.class);
        ctx.refresh();
        VolumeServices luasService1 = ctx.getBean(VolumeServices.class);
        System.out.println("volume service "+luasService1.hitungvolume(45,34,44));

        MasterDataDao mdao = ctx.getBean(MasterDataDao.class);
        Departemen dept = new Departemen();
        dept.setNama("Gelas");
        dept.setDeskripsi("Wadah");
        int iddept = mdao.saveDepartemen(dept);
        System.out.println(" id = "+iddept);

        //mdao.getKonek();
        List<Departemen> listData = mdao.getDeptList();
        for (int i = 0; i<listData.size(); i++){
            System.out.println(
                    listData.get(i).getNama()+" : "+listData.get(i).getDeskripsi());
        }

        Departemen departemenobjek = mdao.getDeptListById(2);
        System.out.println(departemenobjek.getNama() +" | " +departemenobjek.getDeskripsi());

         mdao.DeleteById(41);


        dept.setNama("Handphone");
        mdao.UpdateById(dept);

    }
}
