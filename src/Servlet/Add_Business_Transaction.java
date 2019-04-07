package Servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

import Accounts.Business_Transaction;
import Accounts.Business_Transaction;
import Accounts.Log;

/**
 *
 * @author RED HAWK
 */
@MultipartConfig
@WebServlet(name = "Add_Business_Transaction", urlPatterns = {"/Add_Business_Transaction"})
public class Add_Business_Transaction extends HttpServlet {

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

            Business_Transaction add = new Business_Transaction();
            Log log = new Log();
            
            try {

                int result = add.addpayment(Transaction_Id, Type, Date, Amount);
                
                if (result == 0) {
                    out.print("<script>alert('Error in adding payment')</script>");
                }else{
                    log.addLogEntry("briefcase w3-text-blue", "New record, "+Type+" transaction added on to expenses");
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

}
