package com.ebook.user_servlet;

import com.ebook.DAO.BookOrderImpl;
import com.ebook.DAO.CartDAOImpl;
import com.ebook.DataBaseConnect.DataBaseConnection;
import com.ebook.entity.BookDtls;
import com.ebook.entity.BookOrder;
import com.ebook.entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            HttpSession session = req.getSession();

            int id = Integer.parseInt(req.getParameter("id"));

            String name = req.getParameter("username");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String adress = req.getParameter("address");
            String landmark = req.getParameter("region");
            String city = req.getParameter("city");
            String state = req.getParameter("district");
            String pincode = req.getParameter("zip_code");
            String paymentType = req.getParameter("payment");

            String fullAdd = adress+ "," +landmark+","+city+","+state+","+pincode;

//            System.out.println(name+" "+email+" "+phone+" "+fullAdd+" "+paymentType);


            CartDAOImpl dao = new CartDAOImpl(DataBaseConnection.getConnection());
            List<Cart> cartList =dao.getBookByUser(id);

            if (cartList.isEmpty()){
                session.setAttribute("failedMsg","Add item");
                resp.sendRedirect("checkout.jsp");
            }else {
                BookOrderImpl dao2 = new BookOrderImpl(DataBaseConnection.getConnection());
                BookOrder order = null;


                ArrayList<BookOrder> orderList = new ArrayList<>();
                Random random = new Random();
                for (Cart c:cartList){
                    order = new BookOrder();
                    order.setOrder("BOOK-ORD-00"+random.nextInt(1000));
                    order.setUser_name(name);
                    order.setEmail(email);
                    order.setPhone(phone);
                    order.setFullAdd(fullAdd);
                    order.setBookName(c.getBookName());
                    order.setAuthor(c.getAuthor());
                    order.setPrice(c.getPrice()+"");
                    order.setPaymentType(paymentType);
                    orderList.add(order);

                }

                if ("noselect".equals(paymentType)){
                    session.setAttribute("failedMsg","Choose Payment Method");
                    resp.sendRedirect("checkout.jsp");
                } else {
                    boolean f = dao2.saveOrder(orderList);
                    if (f){
                        resp.sendRedirect("order_success.jsp");
                    }else {
                        session.setAttribute("failedMsg","Your order failed");
                        resp.sendRedirect("checkout.jsp");
                    }
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
