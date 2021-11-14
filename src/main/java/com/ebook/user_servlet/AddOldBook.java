package com.ebook.user_servlet;

import com.ebook.DAO.BookDAOImpl;
import com.ebook.DataBaseConnect.DataBaseConnection;
import com.ebook.entity.BookDtls;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName = req.getParameter("bname_sell");
            String author = req.getParameter("author_sell");
            String price = req.getParameter("price_sell");
            String categories ="Old";
            String status = "Active";
            Part part = req.getPart("bimg_sell");
            String fileName = part.getSubmittedFileName();

            String useremail = req.getParameter("user");


            BookDtls bookDtls = new BookDtls(bookName,author,price,categories,status,fileName,useremail);

            BookDAOImpl dao = new BookDAOImpl(DataBaseConnection.getConnection());


            boolean f = dao.addBooks(bookDtls);
            HttpSession session =req.getSession();

            if (f){

                File file = new File("C:\\Users\\User\\Desktop\\All_of_IT\\All_of_Java\\Spring\\ebook_app\\src\\main\\webapp\\book");

                part.write("C:\\Users\\User\\Desktop\\All_of_IT\\All_of_Java\\Spring\\ebook_app\\src\\main\\webapp\\book"+File.separator+fileName);

                session.setAttribute("successMsg","Book add successfully");
                resp.sendRedirect("sell_book.jsp");
            }else {
                session.setAttribute("failedMsg","Something wrong on Server");
                resp.sendRedirect("sell_book.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }
}

