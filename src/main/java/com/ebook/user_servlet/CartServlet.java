package com.ebook.user_servlet;

import com.ebook.DAO.BookDAOImpl;
import com.ebook.DAO.CartDAOImpl;
import com.ebook.DataBaseConnect.DataBaseConnection;
import com.ebook.entity.BookDtls;
import com.ebook.entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(req.getParameter("bid"));
            int uid = Integer.parseInt(req.getParameter("uid"));

            BookDAOImpl dao = new BookDAOImpl(DataBaseConnection.getConnection());
            BookDtls bookDtls = dao.getBookById(bid);

            Cart cart = new Cart();
            cart.setBid(bid);
            cart.setUserId(uid);
            cart.setBookName(bookDtls.getBook_name());
            cart.setAuthor(bookDtls.getAuthor());
            cart.setPrice(Double.parseDouble(bookDtls.getPrice()));
            cart.setTotal_price(Double.parseDouble(bookDtls.getPrice()));

            CartDAOImpl dao2 = new CartDAOImpl(DataBaseConnection.getConnection());
            boolean f = dao2.addCart(cart);

            HttpSession session = req.getSession();

            if (f){
                session.setAttribute("addCart","Book added to cart");
                resp.sendRedirect("all_new_book.jsp");
            } else {
                session.setAttribute("failedCart","Something wrong on server");
                resp.sendRedirect("all_new_book.jsp");
            }



        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
