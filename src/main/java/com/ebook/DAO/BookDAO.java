package com.ebook.DAO;

import com.ebook.entity.BookDtls;

import java.util.List;

public interface BookDAO {
    public boolean addBooks(BookDtls bookDtls);

    public List<BookDtls> getAllBooks();

    public BookDtls getBookById(int id);

    public  boolean updateEditBooks(BookDtls bookDtls);

    public boolean deleteBooks(int id);

}
