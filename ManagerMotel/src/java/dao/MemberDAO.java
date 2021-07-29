/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Member;
import model.User;

/**
 *
 * @author ADMIN
 */
public class MemberDAO extends DBContext {

    public Member getMemberbyId(int UserId) {
        Member m = null;
        
        String sql = "select * from Member where UserId =?";

        try {
            
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, UserId);
           
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                Date dob = rs.getDate(3);
                String address = rs.getString(4);
                String CCCD = rs.getString(5);
                boolean gender = rs.getBoolean(6);
                double monney = rs.getDouble(7);
                int userId = rs.getInt(8);
                String roomIdS = rs.getString(9);
                int roomId = -1;
                if (roomIdS != null) {
                    roomId = Integer.parseInt(roomIdS);
                }
                m = new Member(id, name, dob, address, CCCD, gender, monney, userId, roomId);

                break;

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return m;
    }

    public Member getMemberbyIdOF(int Id) {
        Member m = null;
        
        String sql = "select * from Member where id =?";

        try {
           
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, Id);
          
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                Date dob = rs.getDate(3);
                String address = rs.getString(4);
                String CCCD = rs.getString(5);
                boolean gender = rs.getBoolean(6);
                double monney = rs.getDouble(7);
                int userId = rs.getInt(8);
                String roomIdS = rs.getString(9);
                int roomId = -1;
                if (roomIdS != null) {
                    roomId = Integer.parseInt(roomIdS);
                }
                m = new Member(id, name, dob, address, CCCD, gender, monney, userId, roomId);

                break;

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return m;
    }

    public List<Member> getListMemberOfRoom(int RoomId) {
        List<Member> list = new ArrayList<Member>();
       
        String sql = "select * from Member where RoomId = ?";

        try {
             
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, RoomId);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                Date dob = rs.getDate(3);
                String address = rs.getString(4);
                String CCCD = rs.getString(5);
                boolean gender = rs.getBoolean(6);
                double monney = rs.getDouble(7);
                int userId = rs.getInt(8);
                String roomIdS = rs.getString(9);
                int roomId = -1;
                if (roomIdS != null) {
                    roomId = Integer.parseInt(roomIdS);
                }
                Member m = new Member(id, name, dob, address, CCCD, gender, monney, userId, roomId);
                list.add(m);

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return list;
    }

    public String getListNameOfRoom(int RoomId) {

        String u = "";
       
        String sql = "select name from Member where RoomId = ?";

        try {
            
            PreparedStatement st = con.prepareStatement(sql);
           
            st.setInt(1, RoomId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                u += rs.getString(1) + " , ";

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return u;

    }

    public void AddMember(Member m) {
        String sql = "INSERT INTO [dbo].[Member]\n"
                + "           ([Name]\n"
                + "           ,[dob]\n"
                + "           ,[address]\n"
                + "           ,[CCCD]\n"
                + "           ,[gender]\n"
                + "           ,[Money]\n"
                + "           ,[UserId]\n"
                + "           ,[RoomId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,NULL)";

        try {
            
            PreparedStatement st = con.prepareStatement(sql);
            
            st.setString(1, m.getName());
            
            java.sql.Date date = new java.sql.Date(m.getDob().getTime());
            st.setDate(2, date);
            st.setString(3, m.getAddress());
            st.setString(4, m.getCCCD());
            st.setBoolean(5, m.isGender());
            st.setDouble(6, m.getMonney());
            st.setInt(7, m.getUserId());

            
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }

    public void updateMoney(int id, double money) {
        String sql = "update Member set [Money]=? where id=?";

        try {
            
            PreparedStatement st = con.prepareStatement(sql);
            
            st.setDouble(1, money);
            st.setInt(2, id);
            

          
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }

    public void updateRoomNull(int id) {
        String sql = "update Member set RoomId =null where id =?";

        try {
           
            PreparedStatement st = con.prepareStatement(sql);
            
            st.setInt(1, id);
            

            
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }

    public void setRoomMember(int rid, int mid) {
        String sql = "update Member set RoomId=? where id=?";

        try {
            
            PreparedStatement st = con.prepareStatement(sql);
           
            st.setInt(1, rid);
            st.setInt(2, mid);

           
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }

}
