package com.ebook.DAO;

import com.ebook.entity.BookDtls;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class BookDAOImpl implements BookDAO{

    private Connection connection;

    public BookDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean addBooks(BookDtls bookDtls) {
        boolean f=false;
        try {
            String sql= "insert into book_dtls(book_name,author,price,book_category,status,photo, email) values (?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, bookDtls.getBook_name());
            ps.setString(2,bookDtls.getAuthor());
            ps.setString(3,bookDtls.getPrice());
            ps.setString(4,bookDtls.getBook_category());
            ps.setString(5,bookDtls.getStatus());
            ps.setString(6,bookDtls.getPhotoName());
            ps.setString(7,bookDtls.getEmail());

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
