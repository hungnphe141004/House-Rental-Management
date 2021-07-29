/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.MemberDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Member;
import model.User;

/**
 *
 * @author ADMIN
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           //check Login
//        if(request.getSession().getAttribute("user")==null){
//             request.setAttribute("mess", "Làm ơn hãy đăng nhập");
//             request.getRequestDispatcher("login.jsp").forward(request, response);
//             return;
//        }
       // processRequest(request, response);
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String name =request.getParameter("name");
        String dobS =request.getParameter("dob");
        //process date
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
         Date date = null;
        try {
             date = f.parse(dobS);
        } catch (ParseException ex) {
            System.out.println(""+ex);
        }
        String adress =request.getParameter("adress");
        String cccd =request.getParameter("cccd");
        //xu ly gioi tinh
        String genderS = request.getParameter("gender");
        Boolean gender = null;
        if (genderS.equals("nam")) {
            gender =true ;
            
        }
        else{
            gender =false ;
        }
        //process 
  
        UserDAO dao = new UserDAO();
        User u = new User(-1, user, pass, null);
        if (dao.checkUserExits(u.getUser())==false) {
            dao.AddUser(u);
            //get id of user 
            u =dao.getUser(u);
            // insert menber
            Member m = new Member(-1, name, date, adress, cccd, gender, 0, u.getId(), -1);
            MemberDAO mdao = new MemberDAO();
            mdao.AddMember(m);
            
              request.setAttribute("mess", "Đăng ký thành công");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
        else{
            request.setAttribute("mess", "Tên đăng nhập đã tồn tại");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
