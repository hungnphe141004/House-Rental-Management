/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.PaymentDAO;
import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Payment;
import model.Room;

/**
 *
 * @author ADMIN
 */
public class AddPayment extends HttpServlet {

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
            out.println("<title>Servlet AddPayment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPayment at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
          
        if(request.getSession().getAttribute("user")==null){
             request.setAttribute("mess", "Làm ơn hãy đăng nhập");
             request.getRequestDispatcher("login.jsp").forward(request, response);
             return;
        }

        //get values
        int momth = Integer.parseInt(request.getParameter("momth"));
        double eletricNumber = Double.parseDouble(request.getParameter("eletric"));

        double waterNumber = Double.parseDouble(request.getParameter("water"));
        String isPayS = request.getParameter("isPay");
        boolean isPay = false;
        if (isPayS.equals("ok")) {
            isPay = true;
        } else {
            isPay = false;
        }
        RoomDAO rdao = new RoomDAO();
         PaymentDAO dao = new PaymentDAO();

        if (request.getParameter("RID").isEmpty()) {
            //add 
            int rid = Integer.parseInt(request.getParameter("rid"));
            //process Room 
            Room room = rdao.getRoomById(rid);
            Payment p = new Payment(-1, momth, eletricNumber, waterNumber, 0, isPay, room);
            //process Total
            p.setTotal(p.calTotalMonth());
            //Add
            dao.AddPayment(p);
            response.sendRedirect("room_detail?id=" + rid + "&op=edit");

        } else {
            //edit
            int RID = Integer.parseInt(request.getParameter("RID"));
            int id = Integer.parseInt(request.getParameter("id"));
            //process Room 
            Room room = rdao.getRoomById(RID);
            Payment p = new Payment(id, momth, eletricNumber, waterNumber, 0, isPay, room);
            p.setTotal(p.calTotalMonth());
            //Edit
            dao.UpdatePayment(p);
            response.sendRedirect("room_detail?id=" + RID + "&op=edit");
            

        }

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
