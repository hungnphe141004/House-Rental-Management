/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Member {
    
    int id ;
    String name ;
    Date dob ;
    String address;
    String CCCD ;
    boolean gender ;
    double monney ;
    int userId ;
    int roomId;

    public Member() {
    }

    public Member(int id, String name, Date dob, String address, String CCCD, boolean gender, double monney, int userId, int roomId) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.address = address;
        this.CCCD = CCCD;
        this.gender = gender;
        this.monney = monney;
        this.userId = userId;
        this.roomId = roomId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCCCD() {
        return CCCD;
    }

    public void setCCCD(String CCCD) {
        this.CCCD = CCCD;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public double getMonney() {
        return monney;
    }

    public void setMonney(double monney) {
        this.monney = monney;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }
    
    

    
    
    
}
