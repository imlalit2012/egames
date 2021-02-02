package com.learn.egames.servlets;

import com.learn.egames.entities.User;
import com.learn.egames.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String contactNumber = request.getParameter("contact_number");
            String emailId = request.getParameter("email_id");
            String userPassword = request.getParameter("user_password");
            String userAddress = request.getParameter("user_address");

            // Validations
            if (firstName.isEmpty()) {
                out.println("First Name cannot be blank");
                return;
            }

            if (lastName.isEmpty()) {
                out.println("Last Name cannot be blank");
                return;
            }

            if (contactNumber.isEmpty()) {
                out.println("Contact Number cannot be blank");
                return;
            }

            if (emailId.isEmpty()) {
                out.println("Email Id cannot be blank");
                return;
            }

            if (userPassword.isEmpty()) {
                out.println("Password cannot be blank");
                return;
            }

            if (userAddress.isEmpty()) {
                out.println("Address cannot be blank");
                return;
            }

            // User Object to Store Data
            User user = new User(firstName, lastName, contactNumber, emailId, userPassword, userAddress, "normal");
            Session hibernateSession = FactoryProvider.getFactory().openSession();
            Transaction tx = hibernateSession.beginTransaction();
            int userId = (int) hibernateSession.save(user);

            tx.commit();
            hibernateSession.close();

            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Registration Successful !! User Id is " + userId);
            response.sendRedirect("register.jsp");
            return;

        } catch (Exception e) {
            e.printStackTrace();
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
