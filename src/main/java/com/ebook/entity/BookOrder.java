package com.ebook.entity;

public class BookOrder {

    private int id;
    private String order;
    private String user_name;
    private String email;
    private String phone;
    private String fullAdd;
    private String paymentType;

    private String bookName;
    private String author;
    private String price;

    public BookOrder() {
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public BookOrder(int id, String order, String user_name, String email, String phone, String fullAdd, String paymentType, String bookName, String author, String price) {
        this.id = id;
        this.order = order;
        this.user_name = user_name;
        this.email = email;
        this.phone = phone;
        this.fullAdd = fullAdd;
        this.paymentType = paymentType;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    @Override
    public String toString() {
        return "BookOrder{" +
                "id=" + id +
                ", order='" + order + '\'' +
                ", user_name='" + user_name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", fullAdd='" + fullAdd + '\'' +
                ", paymentType='" + paymentType + '\'' +
                ", bookname='" + bookName + '\'' +
                ", author='" + author + '\'' +
                ", price='" + price + '\'' +
                '}';
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullAdd() {
        return fullAdd;
    }

    public void setFullAdd(String fullAdd) {
        this.fullAdd = fullAdd;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }
}
