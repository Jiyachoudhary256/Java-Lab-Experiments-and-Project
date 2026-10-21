<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
  private String esc(String s) {
    if (s == null) return "";
    return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;").replace("'","&#x27;");
  }
%>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>Order complete | ShopSphere</title></head>
<body style="font-family:Arial;max-width:700px;margin:60px auto;padding:20px">
<h1>Thank you, <%=esc((String)request.getAttribute("customerName"))%>!</h1>
<p>Your demo order was submitted successfully. No payment was taken.</p>
<p><a href="<%=request.getContextPath()%>/products">Continue shopping</a></p>
</body></html>
