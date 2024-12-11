/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

// Anotasi @WebServlet untuk mendefinisikan URL yang dapat diakses
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ambil data dari form registrasi
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // Proses penyimpanan data ke database
        try {
            classes.JDBC db = new classes.JDBC();
            int result = db.registerUser(username, password, email);

            if (result > 0) {
                response.sendRedirect("product/welcome.jsp"); // Registrasi berhasil, arahkan ke halaman selamat datang
            } else {
                response.getWriter().write("Registrasi gagal! Coba lagi.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
