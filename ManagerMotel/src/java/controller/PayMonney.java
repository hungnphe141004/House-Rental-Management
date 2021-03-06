/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.MemberDAO;
import dao.PaymentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Member;

/**
 *
 * @author ADMIN
 */
public class PayMonney extends HttpServlet {

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
            out.println("<title>Servlet PayMonney</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayMonney at " + request.getContextPath() + "</h1>");
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
             request.setAttribute("mess", "L??m ??n h??y ????ng nh???p");
             request.getRequestDispatcher("login.jsp").forward(request, response);
             return;
        }
       // processRequest(request, response);
       int mid =Integer.parseInt(request.getParameter("mid"));
       int id =Integer.parseInt(request.getParameter("id"));
       double total = Double.parseDouble(request.getParameter("total"));
       double monney = Double.parseDouble(request.getParameter("monney"));
       double monneyEdit = monney-total;
        if (monneyEdit >0) {
            //sucess
            MemberDAO dao = new MemberDAO();
            //edit money
            dao.updateMoney(mid, monneyEdit);
            //edit is pay
            PaymentDAO pdao = new PaymentDAO();
            pdao.updateIspay(id, true);
           response.sendRedirect("myRoom");
            
        }
        else{
            request.setAttribute("mess", "Ban kh??ng ????? ti???n");
            request.getRequestDispatcher("myRoom").forward(request, response);
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
