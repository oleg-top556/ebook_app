package com.ebook.entity;

public class Cart {
    private int cid;
    private int bid;
    private int userId;
    private String bookName;
    private String author;
    private Double price;
    private Double total_price;

    public Cart() {
    }

    public Cart(int bid, int userId, String bookName, String author, Double price, Double total_price) {
        this.bid = bid;
        this.userId = userId;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.total_price = total_price;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cid=" + cid +
                ", bid=" + bid +
                ", userId=" + userId +
                ", bookName='" + bookName + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", total_price=" + total_price +
                '}';
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public void setAuthor(String author) {
        this.author = author;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(Double total_price) {
        this.total_price = total_price;
    }
}