package com.ebook.DAO;

import com.ebook.entity.BookDtls;
import com.ebook.entity.Cart;

import java.util.List;

public interface CartDAO {

    public boolean addCart(Cart cart);

    public List<Cart> getBookByUser(int userId);

    public boolean deleteBook(int bid,int uid, int cid);


}
