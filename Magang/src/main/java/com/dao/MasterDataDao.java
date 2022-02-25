package com.dao;

import com.model.Departemen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Component
public class MasterDataDao {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;


    public void getKonek(){
        Connection con = null;
        try {
           /*  con = DriverManager
                    .getConnection("jdbc:postgresql://localhost/online_shop",
                    "postgres","1304salsa"); */
            PreparedStatement ps = dataSource.getConnection()
                    .prepareStatement("SELECT department_id, name, description FROM public.department");

            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                System.out.println(rs.getInt("department_id")+ " : "+rs.getString("name"));
            }
            rs.close();
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*data yang menangani data kumpulan seperti array
    hanya tidak harus mendeklarasikan, dan tidak harus tau jumlahnya lebih dahulu
            yng di dalam kurung siku artinya list nya isinya yang ada di dalam tersebut*/


    public List<Departemen> getDeptList(){
        String sql = "SELECT department_id, name, description FROM public.department";
        return jdbcTemplate.query(sql,
                (rs, rowNum)->{
            Departemen departemen = new Departemen();
            departemen.setDeskripsi(rs.getString("description"));
            departemen.setNama(rs.getString("name"));
            departemen.setId(rs.getInt("department_id"));
            return departemen;
        });
    }

    public Departemen getDeptListById(int Id){
        String sql = "SELECT department_id, name, description FROM public.department where department_id = ? ";
        return jdbcTemplate.queryForObject(sql,
                (rs, rowNum)->{
                    Departemen departemen = new Departemen();
                    departemen.setDeskripsi(rs.getString("description"));
                    departemen.setNama(rs.getString("name"));
                    departemen.setId(rs.getInt("department_id"));
                    return departemen;
                },Id);
    }
//    public Departemen update(Departemen id){
//        String sql = "UPDATE public.department SET department_id = ?, name = ?, description= ? where department_id = ?";
//        return jdbcTemplate.queryForObject(sql,
//                (rs, rowNum)->{
//                    Departemen departemen = new Departemen();
//                    departemen.setDeskripsi(rs.getString("description"));
//                    departemen.setNama(rs.getString("name"));
//                    departemen.setId(rs.getInt("department_id"));
//                    return departemen;
//                },id);
//        }

    public  void UpdateById(Departemen dept){
        jdbcTemplate.update("UPDATE public.department SET department_id = ?", new Object[]{dept.getNama(),dept.getDeskripsi()});
    }

    public void DeleteById(int Id){
       jdbcTemplate.update("DELETE FROM public.department where department_id = ?",Id);
    }


    public Integer saveDepartemen(Departemen dept){
        KeyHolder keyHolder = new GeneratedKeyHolder();
        String sql =
                "INSERT INTO department( name, description)" +
                        "VALUES ( :nama, :deskripsi)";
        MapSqlParameterSource map = new MapSqlParameterSource();
        map.addValue("nama", dept.getNama());
        map.addValue("deskripsi", dept.getDeskripsi());
        namedParameterJdbcTemplate.update(sql, map, keyHolder);
        return (Integer) keyHolder.getKeys().get("department_id");

    }

    public List<Departemen> getDeptListJdbc(){
        PreparedStatement ps =null;
        List<Departemen> deptList = null;
        try {
             ps = dataSource.getConnection()
                    .prepareStatement("SELECT department_id, name, description FROM public.department");

            ResultSet rs = ps.executeQuery();
            deptList = new ArrayList<>();
            while (rs.next()) {
                Departemen dept = new Departemen();
                dept.setDeskripsi(rs.getString("description"));
                dept.setNama(rs.getString("name"));
                dept.setId(rs.getInt("department_id"));
                deptList.add(dept);
            }
            rs.close();
            ps.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deptList;

        }


}
