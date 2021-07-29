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
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBContext {

    

    public User getUser(User l) {
        User u = null;
        // cau lenh sql 
        String sql = "select * from [User] \n"
                + "where [password] =? and username=?";

        try {
            //tao cau lenh sql trong java 
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, l.getUser());
            st.setString(2, l.getPass());
            // chay cau lenh roi lay ban ghi 
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String pass = rs.getString(3);
                String type = rs.getString(4).trim();
                u = new User(id, username, pass, type);
                break;

            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return u;
    }
    
     public boolean checkUserExits(String username) {

       
        String sql = "select * from [User] where username=?";

        try {
           
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
           
            ResultSet rs = st.executeQuery();
            String user = null;
            while (rs.next()) {
                user =rs.getString(1);
                break;

            }
            if (user ==null) {
                return false;
            }else{
                return true ;
            }

        } catch (Exception e) {
            System.out.println("" + e);
        }

        return false;
    }

    public void AddUser(User u) {
        String sql = "insert [User] values (?,?,'user')";

        try {
           
            PreparedStatement st = con.prepareStatement(sql);
        
            st.setString(1, u.getUser());
            st.setString(2, u.getPass());

         
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("" + e);
        }

    }

}
