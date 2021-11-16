package com.ebook.admin_servlet;

import com.ebook.DAO.BookDAOImpl;
import com.ebook.DataBaseConnect.DataBaseConnection;
import com.ebook.entity.BookDtls;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bname_admin");
            String author = req.getParameter("author_admin");
            String price = req.getParameter("price_admin");
            String status = req.getParameter("bstatus_admin");

            BookDtls bookDtls = new BookDtls();
            bookDtls.setBook_id(id);
            bookDtls.setBook_name(bookName);
            bookDtls.setAuthor(author);
            bookDtls.setPrice(price);
            bookDtls.setStatus(status);

            BookDAOImpl dao = new BookDAOImpl(DataBaseConnection.getConnection());
            boolean f = dao.updateEditBooks(bookDtls);
            HttpSession session = req.getSession();

            if (f){
                session.setAttribute("successMsg", "Книжка була обновлена успішно");
                resp.sendRedirect("admin/all_books.jsp");
            }else {
                session.setAttribute("failedMsg", "На сервері сталася помилка");
                resp.sendRedirect("admin/all_books.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
