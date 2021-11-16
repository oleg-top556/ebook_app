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
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(password);

            HttpSession session = req.getSession();
            if (check != null) {
                UserDaoImpl dao = new UserDaoImpl(DataBaseConnection.getConnection());

                boolean f2 = dao.checkUser(email);
                if (f2){
                    boolean f = dao.userRegister(user);

                    if (f) {
                        session.setAttribute("successMsg", "Регістрація успішна");
                        resp.sendRedirect("register.jsp");
                    } else {
                        session.setAttribute("failed_reg", "На сервері сталася помилка");
                        resp.sendRedirect("register.jsp");
                    }
                }else {
                    session.setAttribute("failed_reg", "Користувач вже зареєстрований.Спробуйте іншу пошту");
                    resp.sendRedirect("register.jsp");
                }

            } else {
                session.setAttribute("failed_reg", "Не забувайте погоджуватись з правилами");
                resp.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
