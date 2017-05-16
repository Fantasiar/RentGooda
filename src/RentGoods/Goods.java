package RentGoods;

import java.sql.Array;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 * Created by Fantasia on 2017/4/25.
 * 目前和数据库中的内容相同5月11日21:24
 */
public class Goods {
    private String Id;
    private String name;
    private String type;
    private String fineness;
    private String description;
    private ArrayList<String> pictures;
    private String ownerId;
    private Date dateChanged;
    private int state;
    private String borrowerId;
    private ArrayList<User> applyer;
    private Date dateReturn;
    private String address;
    private double deposit;
    private double price;
    private double originprice;

    public ArrayList<User> getApplyer() {
        return applyer;
    }

    public void setApplyer(ArrayList<User> applyer) {
        this.applyer = applyer;
    }

    public String getAddress() {
        return address;
    }

    public double getDeposit() {
        return deposit;
    }

    public double getPrice() {
        return price;
    }

    public double getOriginprice() {
        return originprice;
    }

    public void setAddress(String address) {

        this.address = address;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setOriginprice(double originprice) {
        this.originprice = originprice;
    }

    public Goods(){}

    //拥有所有参数
    public Goods(String id, String name, String type, String fineness, String description, ArrayList<String> pictures, String ownerId, Date dateChanged, int state, String borrowerId, Date dateReturn, String address, double deposit, double price, double originprice) {
        Id = id;
        this.name = name;
        this.type = type;
        this.fineness = fineness;
        this.description = description;
        this.pictures = pictures;
        this.ownerId = ownerId;
        this.dateChanged = dateChanged;
        this.state = state;
        this.borrowerId = borrowerId;
        this.dateReturn = dateReturn;
        this.address = address;
        this.deposit = deposit;
        this.price = price;
        this.originprice = originprice;
    }

    public Goods(String id, String name, String type, String fineness, String description, String ownerId, int state) {
        Id = id;
        this.name = name;
        this.type = type;
        this.fineness = fineness;
        this.description = description;
        this.ownerId = ownerId;
        this.state = state;
    }

    public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFineness() {
        return fineness;
    }

    public void setFineness(String fineness) {
        this.fineness = fineness;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<String> getPictures() {
        return pictures;
    }

    public void setPictures(ArrayList<String> pictures) {
        this.pictures = pictures;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public Date getDateChanged() {
        return dateChanged;
    }

    public void setDateChanged(Date dateChanged) {
        this.dateChanged = dateChanged;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getBorrowerId() {
        return borrowerId;
    }

    public void setBorrowerId(String borrowerId) {
        this.borrowerId = borrowerId;
    }

    public Date getDateReturn() {
        return dateReturn;
    }

    public void setDateReturn(Date dateReturn) {
        this.dateReturn = dateReturn;
    }
}

