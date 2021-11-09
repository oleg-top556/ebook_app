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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String name=req.getParameter("fname");
            String email=req.getParameter("email");
            String phone=req.getParameter("phone");
            String password=req.getParameter("password");

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(password);

            HttpSession session = req.getSession();
                UserDaoImpl dao = new UserDaoImpl(DataBaseConnection.getConnection());
                boolean f=dao.userRegister(user);
                if (f) {
                    System.out.println("User Register Success..");
                } else {
                    System.out.println("Something wrong on server..");
                }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
