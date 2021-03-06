package com.ebook.DAO;

import com.ebook.entity.BookDtls;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO {

    private Connection connection;

    public BookDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean addBooks(BookDtls bookDtls) {
        boolean f = false;
        try {
            String sql = "insert into book_dtls(book_name,author,price,book_category,status,photo, email) values (?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, bookDtls.getBook_name());
            ps.setString(2, bookDtls.getAuthor());
            ps.setString(3, bookDtls.getPrice());
            ps.setString(4, bookDtls.getBook_category());
            ps.setString(5, bookDtls.getStatus());
            ps.setString(6, bookDtls.getPhotoName());
            ps.setString(7, bookDtls.getEmail());

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
    public List<BookDtls> getAllBooks() {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls bookDtls = null;

        try {
            String sql = "select * from book_dtls";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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

        } catch (Exception e) {
            e.printStackTrace();

        }
        return list;
    }

    @Override
    public BookDtls getBookById(int id) {
        BookDtls bookDtls = null;

        try {
            String sql = "select*from book_dtls where book_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bookDtls = new BookDtls();
                bookDtls.setBook_id(rs.getInt(1));
                bookDtls.setBook_name(rs.getString(2));
                bookDtls.setAuthor(rs.getString(3));
                bookDtls.setPrice(rs.getString(4));
                bookDtls.setBook_category(rs.getString(5));
                bookDtls.setStatus(rs.getString(6));
                bookDtls.setPhotoName(rs.getString(7));
                bookDtls.setEmail(rs.getString(8));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookDtls;
    }

    @Override
    public boolean updateEditBooks(BookDtls bookDtls) {
        boolean f = false;
        try {
            String sql = "update book_dtls set book_name = ?, author = ?, price = ?, status = ? where book_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, bookDtls.getBook_name());
            ps.setString(2, bookDtls.getAuthor());
            ps.setString(3, bookDtls.getPrice());
            ps.setString(4, bookDtls.getStatus());
            ps.setInt(5, bookDtls.getBook_id());

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
    public boolean deleteBooks(int id) {
        boolean f = false;
        try {
            String sql = "delete from book_dtls where book_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
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
    public List<BookDtls> getNewBook() {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls bookDtls = null;
        try {
            String sql = "select * from book_dtls where book_category = ? and status= ? ORDER BY book_id DESC ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
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
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDtls> getRecentBook() {
        List<BookDtls> list1 = new ArrayList<BookDtls>();
        BookDtls bookDtls = null;
        try {
            String sql = "select * from book_dtls where status = ? ORDER BY book_id DESC ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                bookDtls = new BookDtls();
                bookDtls.setBook_id(rs.getInt(1));
                bookDtls.setBook_name(rs.getString(2));
                bookDtls.setAuthor(rs.getString(3));
                bookDtls.setPrice(rs.getString(4));
                bookDtls.setBook_category(rs.getString(5));
                bookDtls.setStatus(rs.getString(6));
                bookDtls.setPhotoName(rs.getString(7));
                bookDtls.setEmail(rs.getString(8));
                list1.add(bookDtls);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list1;
    }

    @Override
    public List<BookDtls> getOldBook() {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls bookDtls = null;
        try {
            String sql = "select * from book_dtls where book_category = ? and status= ? ORDER BY book_id DESC ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
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
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDtls> getAllRecentBook() {
        List<BookDtls> list1 = new ArrayList<BookDtls>();
        BookDtls bookDtls = null;
        try {
            String sql = "select * from book_dtls where status = ? ORDER BY book_id DESC ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                bookDtls = new BookDtls();
                bookDtls.setBook_id(rs.getInt(1));
                bookDtls.setBook_name(rs.getString(2));
                bookDtls.setAuthor(rs.getString(3));
                bookDtls.setPrice(rs.getString(4));
                bookDtls.setBook_category(rs.getString(5));
                bookDtls.setStatus(rs.getString(6));
                bookDtls.setPhotoName(rs.getString(7));
                bookDtls.setEmail(rs.getString(8));
                list1.add(bookDtls);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list1;
    }

    @Override
    public List<BookDtls> getAllNewBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls bookDtls = null;
        try {
            String sql = "select * from book_dtls where book_category = ? and status= ? ORDER BY book_id DESC ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
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

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDtls> getAllOldBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls bookDtls = null;
        try {
            String sql = "select * from book_dtls where book_category = ? and status= ? ORDER BY book_id DESC ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
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

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDtls> getBookByOldId(String email, String cate) {

        List<BookDtls> list = new ArrayList<>();
        BookDtls bookDtls = null;

        try {

            String sql="select*from book_dtls where book_category=? and email=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,cate);
            ps.setString(2,email);

            ResultSet rs = ps.executeQuery();
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

    @Override
    public boolean oldBookDelete(String email, String cat, int id) {
        boolean f =false;

        try {

            String sql = "delete from book_dtls where book_category=? and email=? and book_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cat);
            ps.setString(2, email);
            ps.setInt(3, id);
            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<BookDtls> getBookBySearch(String ch) {
        List<BookDtls> list = new ArrayList<>();
        BookDtls bookDtls = null;

        try {

            String sql="select*from book_dtls where book_name like ? or author like ? or book_category like ? and status=? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,"%"+ch+"%");
            ps.setString(2,"%"+ch+"%");
            ps.setString(3,"%"+ch+"%");
            ps.setString(4,"Active");

            ResultSet rs = ps.executeQuery();
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
