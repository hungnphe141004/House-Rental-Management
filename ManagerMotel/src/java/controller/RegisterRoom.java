/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.MemberDAO;
import dao.RequestmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Member;
import model.Requestment;
import model.User;

/**
 *
 * @author ADMIN
 */
public class RegisterRoom extends HttpServlet {

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
            out.println("<title>Servlet RegisterRoom</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterRoom at " + request.getContextPath() + "</h1>");
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
           //check Login
        if(request.getSession().getAttribute("user")==null){
             request.setAttribute("mess", "Làm ơn hãy đăng nhập");
             request.getRequestDispatcher("login.jsp").forward(request, response);
             return;
        }
        // processRequest(request, response);
        int rid = Integer.parseInt(request.getParameter("rid"));
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        
        //get member by id 
        MemberDAO mdao = new MemberDAO();
        Member m = mdao.getMemberbyId(u.getId());
        //check checkout 
        if(m.getRoomId()!=-1){
            request.setAttribute("mess", "Làm ơn check out rồi đăng ký");
            request.getRequestDispatcher("home").forward(request, response);
            return;
        }
        //add requestment 
        Requestment r = new Requestment(-1, m.getId(), rid, null, null, null);
        RequestmentDAO redao = new RequestmentDAO();
        redao.AddRequestment(r);
        request.setAttribute("mess", "Yêu cầu của bạn đã được gửi đi");
        request.getRequestDispatcher("home").forward(request, response);
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
        processRequest(request, response);
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
