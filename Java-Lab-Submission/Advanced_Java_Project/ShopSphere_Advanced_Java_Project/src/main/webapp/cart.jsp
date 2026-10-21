<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map,java.util.List,java.math.BigDecimal,com.shopsphere.model.Product,com.shopsphere.dao.ProductDAO" %>
<%!
  private String esc(String s) {
    if (s == null) return "";
    return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;").replace("'","&#x27;");
  }
%>
<%
  Map<Integer,Integer> cart = (Map<Integer,Integer>) session.getAttribute("cart");
  if (cart == null) cart = java.util.Collections.emptyMap();
  BigDecimal total = BigDecimal.ZERO;
  ProductDAO dao = new ProductDAO();
%>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Your Cart | ShopSphere</title><style>
body{font-family:Arial;margin:0;background:#f6f7fb;color:#172033}header{padding:22px 7%;background:white}main{max-width:900px;margin:28px auto;padding:0 16px}
.item{background:#fff;padding:20px;border-radius:12px;margin-bottom:12px;display:flex;justify-content:space-between;gap:18px;align-items:center}
button,.btn{background:#3157d5;color:#fff;border:0;border-radius:8px;padding:10px 14px;text-decoration:none;cursor:pointer}.muted{color:#68738a}
</style></head><body><header><strong>ShopSphere / Cart</strong> · <a href="<%=request.getContextPath()%>/products">Continue shopping</a></header><main>
<h1>Your cart</h1>
<% if (cart.isEmpty()) { %><p class="muted">Your cart is empty. <a href="<%=request.getContextPath()%>/products">Browse products</a>.</p>
<% } else {
  for (Map.Entry<Integer,Integer> entry : cart.entrySet()) {
    Product p = null;
    try { p = dao.findById(entry.getKey()); } catch (Exception e) { throw new jakarta.servlet.jsp.JspException(e); }
    if (p == null) continue;
    BigDecimal line = p.getPrice().multiply(BigDecimal.valueOf(entry.getValue()));
    total = total.add(line);
%>
<div class="item"><div><h3><%=esc(p.getName())%></h3><p>₹<%=p.getPrice().toPlainString()%> × <%=entry.getValue()%> = ₹<%=line.toPlainString()%></p></div>
<form method="post" action="<%=request.getContextPath()%>/cart"><input type="hidden" name="action" value="remove"><input type="hidden" name="productId" value="<%=p.getId()%>"><button type="submit">Remove</button></form></div>
<% } %>
<h2>Total: ₹<%=total.toPlainString()%></h2>
<a class="btn" href="<%=request.getContextPath()%>/checkout">Proceed to checkout</a>
<form method="post" action="<%=request.getContextPath()%>/cart" style="display:inline"><input type="hidden" name="action" value="clear"><button type="submit">Clear cart</button></form>
<% } %>
</main></body></html>
