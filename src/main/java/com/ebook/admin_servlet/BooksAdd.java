package com.ebook.admin_servlet;

import com.ebook.DAO.BookDAOImpl;
import com.ebook.DataBaseConnect.DataBaseConnection;
import com.ebook.entity.BookDtls;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName = req.getParameter("bname_admin");
            String author = req.getParameter("author_admin");
            String price = req.getParameter("price_admin");
            String categories = req.getParameter("categories_admin");
            String status = req.getParameter("bstatus_admin");
            Part part = req.getPart("bimg_admin");
            String fileName = part.getSubmittedFileName();

            BookDtls bookDtls = new BookDtls(bookName,author,price,categories,status,fileName,"admin");

            BookDAOImpl dao = new BookDAOImpl(DataBaseConnection.getConnection());


            boolean f = dao.addBooks(bookDtls);
            HttpSession session =req.getSession();

            if (f){

                File file = new File("C:\\Users\\User\\Desktop\\All_of_IT\\All_of_Java\\Спринг\\Ebook_project\\ebook_app\\src\\main\\webapp\\book");

                part.write("C:\\Users\\User\\Desktop\\All_of_IT\\All_of_Java\\Спринг\\Ebook_project\\ebook_app\\src\\main\\webapp\\book"+File.separator+fileName);

                session.setAttribute("successMsg","Book add successfully");
                resp.sendRedirect("admin/add_books.jsp");
            }else {
                session.setAttribute("failedMsg","Something wrong on Server");
                resp.sendRedirect("admin/add_books.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
