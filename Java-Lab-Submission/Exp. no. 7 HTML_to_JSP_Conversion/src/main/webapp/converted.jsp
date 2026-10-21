<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Converted JSP Page</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f3f6fb; margin: 0; padding: 40px; }
    main { max-width: 650px; margin: auto; background: white; padding: 28px; border-radius: 12px; }
    h1 { color: #244a86; }
    .dynamic { background: #eaf4ff; padding: 14px; border-radius: 8px; }
    input, button { padding: 10px; margin-top: 8px; }
  </style>
</head>
<body>
<main>
  <h1>HTML Converted into JSP</h1>
  <p>This page uses the same HTML structure, with dynamic output generated on the server.</p>
  <div class="dynamic">
    <p><strong>Server date and time:</strong> <%= new java.util.Date() %></p>
    <p><strong>Welcome:</strong>
      <%
        String name = request.getParameter("name");
        if (name == null || name.trim().isEmpty()) {
            name = "Student";
        }
      %>
      <%= name.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\\\"","&quot;").replace("'", "&#39;") %>
    </p>
  </div>
  <form action="converted.jsp" method="get">
    <label for="name">Enter your name:</label><br>
    <input id="name" name="name" type="text" maxlength="60" placeholder="Your name" required>
    <button type="submit">Show greeting</button>
  </form>
  <p><a href="index.html">Back to static HTML page</a></p>
</main>
</body>
</html>