package com.ebook.DAO;

import com.ebook.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
