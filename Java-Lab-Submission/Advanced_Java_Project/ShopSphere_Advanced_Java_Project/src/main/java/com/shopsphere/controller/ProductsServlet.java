package com.shopsphere.controller;

import com.shopsphere.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/products")
public class ProductsServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("products", productDAO.findAll());
            request.getRequestDispatcher("/products.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Unable to load products. Check MySQL settings and database setup.", e);
        }
    }
}
