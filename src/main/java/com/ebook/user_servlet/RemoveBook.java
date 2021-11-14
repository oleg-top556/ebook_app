package com.ebook.user_servlet;

import com.ebook.DAO.CartDAOImpl;
import com.ebook.DataBaseConnect.DataBaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/remove_book")
public class RemoveBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int bid = Integer.parseInt(req.getParameter("bid"));
        int uid = Integer.parseInt(req.getParameter("uid"));
        int cid = Integer.parseInt(req.getParameter("cid"));

        CartDAOImpl dao = new CartDAOImpl(DataBaseConnection.getConnection());
        boolean f=dao.deleteBook(bid,uid,cid);

        HttpSession session = req.getSession();

        if (f){
            session.setAttribute("successMsg","Book removed from Cart");
            resp.sendRedirect("checkout.jsp");
        }else{
            session.setAttribute("failedMsg","Something wrong on server");
            resp.sendRedirect("checkout.jsp");
        }
    }
}
