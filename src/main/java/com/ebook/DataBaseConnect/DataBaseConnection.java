package com.ebook.DataBaseConnect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseConnection {

    private static Connection connection;

    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app","bestuser","bestuser");
        }catch (Exception e){
            e.printStackTrace();
        }
        return connection;
    }
}
