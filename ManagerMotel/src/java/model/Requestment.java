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
public class Requestment {
    int id ;
    int MemberId ;
    int RoomId ;
    Date date ;
    String MemberName ;
    String RoomName ;

    public Requestment() {
    }

    public Requestment(int id, int MemberId, int RoomId, Date date, String MemberName, String RoomName) {
        this.id = id;
        this.MemberId = MemberId;
        this.RoomId = RoomId;
        this.date = date;
        this.MemberName = MemberName;
        this.RoomName = RoomName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemberId() {
        return MemberId;
    }

    public void setMemberId(int MemberId) {
        this.MemberId = MemberId;
    }

    public int getRoomId() {
        return RoomId;
    }

    public void setRoomId(int RoomId) {
        this.RoomId = RoomId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getMemberName() {
        return MemberName;
    }

    public void setMemberName(String MemberName) {
        this.MemberName = MemberName;
    }

    public String getRoomName() {
        return RoomName;
    }

    public void setRoomName(String RoomName) {
        this.RoomName = RoomName;
    }

   
    
    
    
    
    
}
