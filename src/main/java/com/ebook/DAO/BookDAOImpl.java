package com.ebook.DAO;

import com.ebook.entity.BookDtls;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

    @Override
    public List<BookDtls> getAllBooks() {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls bookDtls = null;

        try {
            String sql = "select * from book_dtls";
            PreparedStatement ps=connection.prepareStatement(sql);

            ResultSet rs= ps.executeQuery();
            while (rs.next()){
                bookDtls = new BookDtls();
                bookDtls.setBook_id(rs.getInt(1));
                bookDtls.setBook_name(rs.getString(2));
                bookDtls.setAuthor(rs.getString(3));
                bookDtls.setPrice(rs.getString(4));
                bookDtls.setBook_category(rs.getString(5));
                bookDtls.setStatus(rs.getString(6));
                bookDtls.setPhotoName(rs.getString(7));
                bookDtls.setEmail(rs.getString(8));

                list.add(bookDtls);
            }

        }catch (Exception e){
            e.printStackTrace();

        }
        return list;
    }


}
