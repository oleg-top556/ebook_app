package com.ebook.DAO;

import com.ebook.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDaoImpl implements UserDao{

    private Connection connection;

    public UserDaoImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean userRegister(User user) {
        boolean f= false;

        try {
            String sql = "insert into user(name, email, phone,password) values (?,?,?,?)";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPhone());
            ps.setString(4,user.getPassword());

            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public User login(String email, String password) {
       User us=null;

        try {
            String sql="select * from user where email=? and password=?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,email);
            ps.setString(2,password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                us=new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhone(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));
                us.setLandmark(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setState(rs.getString(9));
                us.setPincode(rs.getString(10));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return us;
    }

    @Override
    public boolean checkPassword(int id, String ps) {
        boolean f =false;

        try {
            String sql="select * from user where id=? and password=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            preparedStatement.setString(2,ps);

            ResultSet rs= preparedStatement.executeQuery();
            while (rs.next()){
                f=true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean updateProfile(User user) {
        boolean f = false;

        try {
            String sql = "update user set name=?, email=?, phone=? where id=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPhone());
            ps.setInt(4, user.getId());

            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean checkUser(String em) {
        boolean f =true;

       try {
           String sql = "select * from user where email=?";
           PreparedStatement ps=connection.prepareStatement(sql);
           ps.setString(1,em);
           ResultSet rs = ps.executeQuery();
           while (rs.next()){
               f=false;
           }
       }catch (Exception e){
           e.printStackTrace();
       }

        return f;
    }
}
