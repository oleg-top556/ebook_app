package com.ebook.DAO;

import com.ebook.entity.BookDtls;

import java.util.List;

public interface BookDAO {
    public boolean addBooks(BookDtls bookDtls);

    public List<BookDtls> getAllBooks();

    public BookDtls getBookById(int id);

    public  boolean updateEditBooks(BookDtls bookDtls);

    public boolean deleteBooks(int id);

    public List<BookDtls> getNewBook();

    public List<BookDtls> getRecentBook();

    public List<BookDtls> getOldBook();

    public List<BookDtls> getAllRecentBook();

    public List<BookDtls> getAllNewBook();

    public List<BookDtls> getAllOldBook();

    public List<BookDtls> getBookByOldId(String email, String cate);

    public boolean oldBookDelete(String email, String cat, int id);

    public List<BookDtls> getBookBySearch(String ch);

}
