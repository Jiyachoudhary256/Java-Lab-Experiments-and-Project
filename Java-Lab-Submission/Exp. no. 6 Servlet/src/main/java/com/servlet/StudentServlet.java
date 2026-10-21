package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!doctype html><html><head><meta charset='UTF-8'><title>Student Form</title></head><body>");
            out.println("<h1>Student Information</h1>");
            out.println("<form method='post' action='student'>");
            out.println("<label>Name: <input name='name' required></label><br><br>");
            out.println("<label>Email: <input type='email' name='email' required></label><br><br>");
            out.println("<label>Course: <input name='course' required></label><br><br>");
            out.println("<button type='submit'>Submit</button></form>");
            out.println("<p><a href='index.html'>Back to Home</a></p></body></html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String name = safe(request.getParameter("name"));
        String email = safe(request.getParameter("email"));
        String course = safe(request.getParameter("course"));

        try (PrintWriter out = response.getWriter()) {
            out.println("<!doctype html><html><head><meta charset='UTF-8'><title>Student Details</title></head><body>");
            out.println("<h1>Student Details Submitted</h1>");
            out.println("<p><strong>Name:</strong> " + escapeHtml(name) + "</p>");
            out.println("<p><strong>Email:</strong> " + escapeHtml(email) + "</p>");
            out.println("<p><strong>Course:</strong> " + escapeHtml(course) + "</p>");
            out.println("<p><em>Demo only: data is displayed, not saved to a database.</em></p>");
            out.println("<p><a href='student'>Enter another student</a> | <a href='index.html'>Home</a></p>");
            out.println("</body></html>");
        }
    }

    private String safe(String value) {
        return value == null ? "" : value;
    }

    private String escapeHtml(String value) {
        return value.replace("&", "&amp;").replace("<", "&lt;")
                    .replace(">", "&gt;").replace("\"", "&quot;")
                    .replace("'", "&#x27;");
    }
}
