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

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name_edit_profile");
            String email = req.getParameter("email_edit_profile");
            String phone = req.getParameter("phone_edit_profile");
            String password = req.getParameter("password_edit_profile");

            User user = new User();
            user.setId(id);
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);

            HttpSession session =req.getSession();

            UserDaoImpl dao = new UserDaoImpl(DataBaseConnection.getConnection());
            boolean f = dao.checkPassword(id,password);
            if (f){
                boolean f2 = dao.updateProfile(user);
                if (f2){
                    session.setAttribute("successMsg", "Профіль користувача змінений ");
                    resp.sendRedirect("edit_profile.jsp");
                }else {
                    session.setAttribute("failedMsg", "На сервері сталася помилка");
                    resp.sendRedirect("edit_profile.jsp");
                }
            }else {
                session.setAttribute("failedMsg", "Ваш пароль неправильний ");
                resp.sendRedirect("edit_profile.jsp");
            }


        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
