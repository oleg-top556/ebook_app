package com.ebook.DAO;

import com.ebook.entity.BookOrder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookOrderImpl implements BookOrderDAO {

    private Connection connection;

    public BookOrderImpl(Connection connection) {
        this.connection = connection;
    }



    @Override
    public boolean saveOrder(List<BookOrder> bookOrder) {
        boolean f= false;

        try {

            String sql = "insert into book_order (order_id,user_name,email,address,phone,book_name,author,price,payment) " +
                    "values (?,?,?,?,?,?,?,?,?)";

            connection.setAutoCommit(false);
            PreparedStatement ps = connection.prepareStatement(sql);

            for (BookOrder b:bookOrder){
                ps.setString(1,b.getOrder());
                ps.setString(2,b.getUser_name());
                ps.setString(3,b.getEmail());
                ps.setString(4,b.getFullAdd());
                ps.setString(5,b.getPhone());
                ps.setString(6,b.getBookName());
                ps.setString(7,b.getAuthor());
                ps.setString(8,b.getPrice());
                ps.setString(9,b.getPaymentType());
                ps.addBatch();

            }

            int[] count = ps.executeBatch();
            connection.commit();
            f=true;
            connection.setAutoCommit(true);

        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<BookOrder> getBook(String email) {
        List<BookOrder> list = new ArrayList<>();
        BookOrder order = null;

        try {
            String sql = "select * from book_order where email=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                order=new BookOrder();
                order.setId(rs.getInt(1));
                order.setOrder(rs.getString(2));
                order.setUser_name(rs.getString(3));
                order.setEmail(rs.getString(4));
                order.setFullAdd(rs.getString(5));
                order.setPhone(rs.getString(6));
                order.setBookName(rs.getString(7));
                order.setAuthor(rs.getString(8));
                order.setPrice(rs.getString(9));
                order.setPaymentType(rs.getString(10));
                list.add(order);

            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookOrder> getAllOrder() {
        List<BookOrder> list = new ArrayList<>();
        BookOrder order = null;

        try {
            String sql = "select * from book_order";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                order=new BookOrder();
                order.setId(rs.getInt(1));
                order.setOrder(rs.getString(2));
                order.setUser_name(rs.getString(3));
                order.setEmail(rs.getString(4));
                order.setFullAdd(rs.getString(5));
                order.setPhone(rs.getString(6));
                order.setBookName(rs.getString(7));
                order.setAuthor(rs.getString(8));
                order.setPrice(rs.getString(9));
                order.setPaymentType(rs.getString(10));
                list.add(order);

            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
