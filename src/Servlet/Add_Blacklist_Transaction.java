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

import Accounts.Bad_Debt;
import Accounts.Booking_Transaction;
import Accounts.Log;

/**
 *
 * @author RED HAWK
 */
@MultipartConfig
@WebServlet(name = "Add_Blacklist_Transaction", urlPatterns = {"/Add_Blacklist_Transaction"})
public class Add_Blacklist_Transaction extends HttpServlet {

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

            String Transaction_Id = request.getParameter("tid");
            String Business_name = request.getParameter("Business_name");
            String Department = request.getParameter("Department");
            String Amount = request.getParameter("Amount");
            String Date = request.getParameter("Date");

            Booking_Transaction delete = new Booking_Transaction();
            Bad_Debt add = new Bad_Debt();
            Log log = new Log();

            try {
                int addResult = add.addBadDebt(Transaction_Id, Business_name, Department, Amount, Date);

                if (addResult == 1) {

                    int deleteResult = delete.deleteBooking(Transaction_Id);
                    log.addLogEntry("user-minus w3-text-blue", "New record, transaction " + Transaction_Id + " added to bad debt");

                    if (deleteResult == 0) {
                        out.println("<script>alert('Error in deleteing booking transaction')</script>");
                    }

                } else {
                    out.println("<script>alert('Error in adding bad debt')</script>");
                }

            } catch (Exception e) {
                out.println(e);

            } finally {
                response.sendRedirect(request.getContextPath() + "/view_booking_transactions.jsp");
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
