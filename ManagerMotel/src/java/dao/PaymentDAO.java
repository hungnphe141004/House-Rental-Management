/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Member;
import model.Payment;
import model.Room;

/**
 *
 * @author ADMIN
 */
public class PaymentDAO extends DBContext {

    public List<Payment> getAll(int rid) {
        List<Payment> list = new ArrayList<Payment>();

        
        String sql = "select * from Payment where RoomId=? order by month ASC";

        try {
            
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, rid);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int momth = rs.getInt(2);
                double eletricNumber = rs.getDouble(3);

                double waterNumber = rs.getDouble(4);
                double total = rs.getDouble(5);
                boolean isPay = rs.getBoolean(7);
                Room room = null;
                Payment p = new Payment(id, momth, eletricNumber, waterNumber, total, isPay, room);
                list.add(p);

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return list;
    }

    public Payment getPaymentById(int pid) {
        Payment p = new Payment();

        // cau lenh sql 
        String sql = "select * from Payment where id=?";

        try {
            //tao cau lenh sql trong java 
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, pid);
            // chay cau lenh roi lay ban ghi 
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int momth = rs.getInt(2);
                double eletricNumber = rs.getDouble(3);

                double waterNumber = rs.getDouble(4);
                double total = rs.getDouble(5);
                boolean isPay = rs.getBoolean(7);
                Room room = new Room();
                room.setId(rs.getInt(6));
                p = new Payment(id, momth, eletricNumber, waterNumber, total, isPay, room);

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return p;
    }

    public void AddPayment(Payment p) {
        String sql = "INSERT INTO [dbo].[Payment]\n"
                + "           ([month]\n"
                + "           ,[eletricNumber]\n"
                + "           ,[waterNumber]\n"
                + "           ,[total]\n"
                + "           ,[RoomId]\n"
                + "           ,[isPay])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            
            PreparedStatement st = con.prepareStatement(sql);
            
            st.setInt(1, p.getMomth());
            st.setDouble(2, p.getEletricNumber());
            st.setDouble(3, p.getWaterNumber());
            st.setDouble(4, p.calTotalMonth());
            st.setDouble(5, p.getRoom().getId());
            st.setBoolean(6, p.isIsPay());

            
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }

    public void UpdatePayment(Payment p) {
        String sql = "UPDATE [dbo].[Payment]\n"
                + "   SET [month] = ?\n"
                + "      ,[eletricNumber] = ?\n"
                + "      ,[waterNumber] = ?\n"
                + "      ,[total] = ?\n"
                + "      ,[RoomId] = ?\n"
                + "      ,[isPay] = ?\n"
                + " WHERE id=?";

        try {
           
            PreparedStatement st = con.prepareStatement(sql);
            
            st.setInt(1, p.getMomth());
            st.setDouble(2, p.getEletricNumber());
            st.setDouble(3, p.getWaterNumber());
            st.setDouble(4, p.calTotalMonth());
            st.setDouble(5, p.getRoom().getId());
            st.setBoolean(6, p.isIsPay());
            st.setInt(7, p.getId());

           
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }   
    
     public void updateIspay(int id,boolean isPay) {
        String sql = "UPDATE [dbo].[Payment]\n"
                + "   SET [isPay] = ?\n"
                + " WHERE id=?";

        try {
            
            PreparedStatement st = con.prepareStatement(sql);
          
            
             st.setBoolean(1, isPay);
             st.setInt(2, id);
          
          
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }
    
    
    
    public void DeletePayment(int id ) {
        String sql = "delete Payment where id=?";

        try {
           
            PreparedStatement st = con.prepareStatement(sql);
            
            st.setInt(1, id);
           

            
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }

}
