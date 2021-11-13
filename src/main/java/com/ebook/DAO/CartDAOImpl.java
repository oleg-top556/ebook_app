package com.ebook.DAO;

import com.ebook.entity.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CartDAOImpl implements CartDAO {

    private Connection connection;

    public CartDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean addCart(Cart cart) {
        boolean f=false;
        try {
            String sql = "insert into cart(bid,uid,bookName,author,price,total_price) values(?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,cart.getBid());
            ps.setInt(2,cart.getUserId());
            ps.setString(3,cart.getBookName());
            ps.setString(4,cart.getAuthor());
            ps.setDouble(5,cart.getPrice());
            ps.setDouble(6,cart.getTotal_price());

            int i = ps.executeUpdate();
            if (i==1){
                f=true;
            }


        }catch (Exception e){
            e.printStackTrace();
        }


        return f;
    }
}
