package com.ebook.DAO;

import com.ebook.entity.BookOrder;

import java.util.List;

public interface BookOrderDAO {

    public boolean saveOrder(List<BookOrder> bookOrder);
}
