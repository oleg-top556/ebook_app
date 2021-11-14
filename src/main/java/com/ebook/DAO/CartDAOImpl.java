package com.ebook.DAO;

import com.ebook.entity.BookDtls;
import com.ebook.entity.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO {

    private Connection connection;

    public CartDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean addCart(Cart cart) {
        boolean f = false;
        try {
            String sql = "insert into cart(bid,uid,bookName,author,price,total_price) values(?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cart.getBid());
            ps.setInt(2, cart.getUserId());
            ps.setString(3, cart.getBookName());
            ps.setString(4, cart.getAuthor());
            ps.setDouble(5, cart.getPrice());
            ps.setDouble(6, cart.getTotal_price());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }


        } catch (Exception e) {
            e.printStackTrace();
        }


        return f;
    }

    @Override
    public List<Cart> getBookByUser(int userId) {

        List<Cart> list = new ArrayList<>();
        Cart cart = null;
        double totalPrice = 0.0;


        try {
            String sql = "select * from cart where uid=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cart = new Cart();
                cart.setCid(rs.getInt(1));
                cart.setBid(rs.getInt(2));
                cart.setUserId(rs.getInt(3));
                cart.setBookName(rs.getString(4));
                cart.setAuthor(rs.getString(5));
                cart.setPrice(rs.getDouble(6));

                totalPrice = totalPrice + rs.getDouble(7);
                cart.setTotal_price(totalPrice);

                list.add(cart);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean deleteBook(int bid,int uid, int cid) {

        boolean f = false;

        try {
            String sql = "delete from cart where bid =? and uid=? and cid=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2,uid);
            ps.setInt(3,cid);

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
