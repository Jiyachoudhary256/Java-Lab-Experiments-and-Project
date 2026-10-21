package com.shopsphere.controller;

import com.shopsphere.dao.ProductDAO;
import com.shopsphere.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @SuppressWarnings("unchecked")
    private Map<Integer, Integer> getCart(HttpSession session) {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new LinkedHashMap<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = getCart(session);

        try {
            if ("add".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                Product product = new ProductDAO().findById(productId);
                if (product != null && product.getStock() > 0) {
                    cart.merge(productId, 1, Integer::sum);
                }
            } else if ("remove".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                cart.remove(productId);
            } else if ("clear".equals(action)) {
                cart.clear();
            }
        } catch (NumberFormatException ignored) {
            // Invalid product IDs are ignored.
        } catch (Exception e) {
            throw new ServletException("Unable to update cart. Check the database connection.", e);
        }
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
