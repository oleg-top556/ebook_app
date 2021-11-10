package com.ebook.DAO;

import com.ebook.entity.BookDtls;

import java.util.List;

public interface BookDAO {
    public boolean addBooks(BookDtls bookDtls);

    public List<BookDtls> getAllBooks();
}
