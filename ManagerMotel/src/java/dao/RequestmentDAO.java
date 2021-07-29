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
import java.util.Date;
import java.util.List;
import model.Requestment;
import model.Room;
import model.User;

/**
 *
 * @author ADMIN
 */
public class RequestmentDAO extends DBContext {

    public List<Requestment> getAll() {
        List<Requestment> list = new ArrayList<Requestment>();

     
        String sql = "select Requestment.* ,Room.Name,Member.Name\n"
                + "from Requestment,Room,Member\n"
                + "where Requestment.MemberId=Member.id\n"
                + "and Requestment.RoomId=Room.Id\n"
                + "order by [date]";

        try {
           
            PreparedStatement st = con.prepareStatement(sql);
           
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int MemberId = rs.getInt(2);
                int RoomId = rs.getInt(3);
                Date date = rs.getDate(4);
                String Rname = rs.getString(5);
                String Mname = rs.getString(6);
                Requestment r = new Requestment(id, MemberId, RoomId, date, Mname, Rname);

                list.add(r);

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return list;
    }

    public List<Requestment> getAllbyMId(int mid) {
        List<Requestment> list = new ArrayList<Requestment>();

        
        String sql = "select Requestment.* ,Room.Name,Member.Name\n"
                + "            from Requestment,Room,Member\n"
                + "                where Requestment.MemberId=Member.id\n"
                + "               and Requestment.RoomId=Room.Id\n"
                + "			   and Requestment.MemberId =?\n"
                + "                order by [date]";

        try {
           
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, mid);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int MemberId = rs.getInt(2);
                int RoomId = rs.getInt(3);
                Date date = rs.getDate(4);
                String Rname = rs.getString(5);
                String Mname = rs.getString(6);
                Requestment r = new Requestment(id, MemberId, RoomId, date, Mname, Rname);

                list.add(r);

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return list;
    }

    public void AddRequestment(Requestment r) {
        String sql = "insert Requestment values (?,?,GETDATE())";

        try {
          
            PreparedStatement st = con.prepareStatement(sql);
          
            st.setInt(1, r.getMemberId());
            st.setInt(2, r.getRoomId());

            
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }

    public void Delete(int id) {
        String sql = "delete Requestment where id =?";

        try {
            
            PreparedStatement st = con.prepareStatement(sql);
           
            st.setInt(1, id);

         
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }

}
