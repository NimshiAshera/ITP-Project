/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Accounts.Business_Transaction;
import Accounts.Log;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Redhw
 */
@WebServlet(name = "Update_Business_Transaction", urlPatterns = {"/Update_Business_Transaction"})
public class Update_Business_Transaction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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

            String Transaction_Id = request.getParameter("Transaction_Id");
            String Type = request.getParameter("Type");
            String Date = request.getParameter("Date");
            String Amount = request.getParameter("Amount");

            Business_Transaction update = new Business_Transaction();
            Log log = new Log();

            try {

                int result = update.updateBusinessTransaction(Transaction_Id, Type, Date, Amount);

                if (result == 0) {
                    out.print("<script>alert('Error in updating transaction')</script>");
                }else{
                    log.addLogEntry("business-time w3-text-yellow", "Updated record, transaction " + Transaction_Id + " updated on expenses");
                }

            } catch (Exception e) {
                out.println(e);
            } finally {
                response.sendRedirect(request.getContextPath() + "/view_business_transactions.jsp");
            }
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

    int updateBusinessTransaction(String Transaction_Id, String Type, String Date, String Amount) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
