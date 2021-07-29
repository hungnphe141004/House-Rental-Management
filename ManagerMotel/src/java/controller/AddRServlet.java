/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Room;

/**
 *
 * @author ADMIN
 */
public class AddRServlet extends HttpServlet {

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
            out.println("<title>Servlet AddRServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddRServlet at " + request.getContextPath() + "</h1>");
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
          
        if(request.getSession().getAttribute("user")==null){
             request.setAttribute("mess", "Làm ơn hãy đăng nhập");
             request.getRequestDispatcher("login.jsp").forward(request, response);
             return;
        }
        //processRequest(request, response);
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        boolean avai = false;
        double eletric = Double.parseDouble(request.getParameter("eletric"));
        double water = Double.parseDouble(request.getParameter("water"));
        double wifi = Double.parseDouble(request.getParameter("wifi"));
        double clean = Double.parseDouble(request.getParameter("clean"));
        double moth = Double.parseDouble(request.getParameter("moth"));
        RoomDAO dao = new RoomDAO();
        if (request.getParameter("id").isEmpty()) { 
            //add
            Room r = new Room(-1, name, type, avai, eletric, water, wifi, clean, moth);
            dao.AddRoom(r);
            response.sendRedirect("edit");

        } else {
            //edit
            int id =Integer.parseInt(request.getParameter("id"));
            String avais = request.getParameter("avai");
            if(avais.equals("ok")){
                avai = false;
            }else{
                avai = true;
            }
            
             Room r = new Room(id, name, type, avai, eletric, water, wifi, clean, moth);
             dao.EditRoom(r);
             response.sendRedirect("edit");
            

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
