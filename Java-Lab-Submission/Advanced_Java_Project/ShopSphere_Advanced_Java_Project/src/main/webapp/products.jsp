<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.shopsphere.model.Product" %>
<%!
  private String esc(String s) {
    if (s == null) return "";
    return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;").replace("'","&#x27;");
  }
%>
<%
  List<Product> products = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Products | ShopSphere</title>
<style>
body{font-family:Arial;margin:0;background:#f6f7fb;color:#172033}header{padding:22px 7%;background:#fff;display:flex;justify-content:space-between}
a{color:#3157d5;text-decoration:none}.grid{padding:28px 7%;display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:18px}
.card{background:#fff;padding:22px;border-radius:12px;box-shadow:0 3px 14px #00000008}.category{color:#69748b;font-size:13px}.price{font-size:22px;font-weight:bold}
button{background:#3157d5;color:white;border:0;border-radius:8px;padding:11px 14px;cursor:pointer}
</style></head><body>
<header><strong>ShopSphere / Products</strong><nav><a href="<%=request.getContextPath()%>/">Home</a> · <a href="<%=request.getContextPath()%>/cart">Cart</a></nav></header>
<main class="grid">
<% if (products == null || products.isEmpty()) { %>
  <div class="card"><h2>No products found</h2><p>Check that the database SQL script was executed.</p></div>
<% } else { for (Product p : products) { %>
  <article class="card">
    <div class="category"><%=esc(p.getCategory())%></div>
    <h2><%=esc(p.getName())%></h2><p><%=esc(p.getDescription())%></p>
    <p class="price">₹<%=p.getPrice().toPlainString()%></p><p>In stock: <%=p.getStock()%></p>
    <form method="post" action="<%=request.getContextPath()%>/cart">
      <input type="hidden" name="action" value="add"><input type="hidden" name="productId" value="<%=p.getId()%>">
      <button type="submit">Add to cart</button>
    </form>
  </article>
<% } } %>
</main></body></html>
