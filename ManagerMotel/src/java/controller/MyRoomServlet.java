/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.MemberDAO;
import dao.PaymentDAO;
import dao.RequestmentDAO;
import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Member;
import model.Payment;
import model.Requestment;
import model.Room;
import model.User;

/**
 *
 * @author ADMIN
 */
public class MyRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet MyRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyRoomServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
          if (request.getAttribute("mess")!=null) {
             request.setAttribute("mess", request.getAttribute("mess").toString());
        }
        //get Id Room by session
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        MemberDAO mdao = new MemberDAO();
        Member m = mdao.getMemberbyId(u.getId());
        if (m.getRoomId() == -1) {
            //no Room of Member
            //get list Requestment
            RequestmentDAO rdao = new RequestmentDAO();
            List<Requestment> list = rdao.getAllbyMId(m.getId());
            if (list.size() < 1) {
                //no request ,no room
                request.setAttribute("mess", "Bạn chưa đăng ký phòng");
                request.getRequestDispatcher("home").forward(request, response);
            } else {
                request.setAttribute("listRq", list);
                request.getRequestDispatcher("MyRoom.jsp").forward(request, response);

            }

        } else {
            //have Roon
            request.setAttribute("m", m);
            RoomDAO dao = new RoomDAO();
            Room r = dao.getRoomById(m.getRoomId());
            request.setAttribute("room", r);
            //get name of member
            String name =mdao.getListNameOfRoom(m.getRoomId());
            request.setAttribute("member", name);
            //get payment of Room
            PaymentDAO pdao = new PaymentDAO();
             List<Payment> list = pdao.getAll(m.getRoomId());
             request.setAttribute("list", list);
             request.getRequestDispatcher("MyRoom.jsp").forward(request, response);

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
