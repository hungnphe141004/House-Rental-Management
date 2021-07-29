/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Room;
import model.User;

/**
 *
 * @author ADMIN
 */
public class RoomDAO extends DBContext {

    public List<Room> getAll() {
        List<Room> list = new ArrayList<Room>();

       
        String sql = "select * from Room";

        try {
           
            PreparedStatement st = con.prepareStatement(sql);
           
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String RoomType = rs.getString(3);
                Boolean available = rs.getBoolean(4);
                double electricPrice = rs.getDouble(5);
                double waterPricce = rs.getDouble(6);
                double wifi = rs.getDouble(7);
                double clean = rs.getDouble(8);
                double mothPrice = rs.getDouble(9);
                Room r = new Room(id, name, RoomType, available, electricPrice, waterPricce, wifi, clean, mothPrice);
                list.add(r);

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return list;
    }

    public Room getRoomById(int idRoom) {
        Room r = new Room();

   
        String sql = "select * from Room where id= ?";

        try {
   
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idRoom);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2).trim();
                String RoomType = rs.getString(3).trim();
                Boolean available = rs.getBoolean(4);
                double electricPrice = rs.getDouble(5);
                double waterPricce = rs.getDouble(6);
                double wifi = rs.getDouble(7);
                double clean = rs.getDouble(8);
                double mothPrice = rs.getDouble(9);
                r = new Room(id, name, RoomType, available, electricPrice, waterPricce, wifi, clean, mothPrice);
                break;

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return r;
    }

    public void AddRoom(Room r) {
        String sql = "INSERT INTO [dbo].[Room]\n"
                + "           ([Name]\n"
                + "           ,[RoomType]\n"
                + "           ,[available]\n"
                + "           ,[electricPrice]\n"
                + "           ,[waterPricce]\n"
                + "           ,[wifi]\n"
                + "           ,[clean]\n"
                + "           ,[mothPrice])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
           
            PreparedStatement st = con.prepareStatement(sql);
             
            st.setString(1, r.getName());
            st.setString(2, r.getRoomType());
            st.setBoolean(3, r.getAvailable());
            st.setDouble(4, r.getElectricPrice());
            st.setDouble(5, r.getWaterPricce());
            st.setDouble(6, r.getWifi());
            st.setDouble(7, r.getClean());
            st.setDouble(8, r.getMothPrice());

           
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }

    public void EditRoom(Room r) {
        String sql = "UPDATE [dbo].[Room]\n"
                + "   SET [Name] = ?\n"
                + "      ,[RoomType] = ?\n"
                + "      ,[available] = ?\n"
                + "      ,[electricPrice] = ?\n"
                + "      ,[waterPricce] = ?\n"
                + "      ,[wifi] = ?\n"
                + "      ,[clean] = ?\n"
                + "      ,[mothPrice] = ?\n"
                + " WHERE Id =?";

        try {
             
            PreparedStatement st = con.prepareStatement(sql);
           
            st.setString(1, r.getName());
            st.setString(2, r.getRoomType());
            st.setBoolean(3, r.getAvailable());
            st.setDouble(4, r.getElectricPrice());
            st.setDouble(5, r.getWaterPricce());
            st.setDouble(6, r.getWifi());
            st.setDouble(7, r.getClean());
            st.setDouble(8, r.getMothPrice());
            st.setInt(9, r.getId());

            
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }
    
     public void setRoomAvailable(int id) {
        String sql = "update Room set available=1 where Id=?";

        try {
          
            PreparedStatement st = con.prepareStatement(sql);
           
            st.setInt(1, id);
           

          
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }
    
    
    public void DeleteRoom(int id) {
        String sql = "delete Room where Id=?";

        try {
          
            PreparedStatement st = con.prepareStatement(sql);
           
          st.setInt(1, id);

           
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }


}
