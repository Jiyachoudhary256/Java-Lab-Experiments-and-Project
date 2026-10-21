package com.shopsphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        if (name == null || name.isBlank() || email == null || email.isBlank()) {
            request.setAttribute("error", "Please enter your name and email.");
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            return;
        }
        HttpSession session = request.getSession();
        session.removeAttribute("cart");
        request.setAttribute("customerName", name);
        request.getRequestDispatcher("/order-success.jsp").forward(request, response);
    }
}
