package com.ebook.user_servlet;

import com.ebook.DAO.UserDaoImpl;
import com.ebook.DataBaseConnect.DataBaseConnection;
import com.ebook.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDaoImpl dao = new UserDaoImpl(DataBaseConnection.getConnection());
            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");

            if ("admin@gmail.com".equals(email)&&"admin".equals(password)){
                User us = new User();
                session.setAttribute("userobj",us);
                resp.sendRedirect("admin/home_admin.jsp");
            } else {

                User us = dao.login(email,password);
                if (us!=null){
                    session.setAttribute("userobj",us);
                    resp.sendRedirect("home_user.jsp");
                } else {
                    session.setAttribute("failedMsg","Email & Password Invalid");
                    resp.sendRedirect("login.jsp");
                }


                resp.sendRedirect("home_user.jsp");
            }

        }catch (Exception e){

        }
    }
}
