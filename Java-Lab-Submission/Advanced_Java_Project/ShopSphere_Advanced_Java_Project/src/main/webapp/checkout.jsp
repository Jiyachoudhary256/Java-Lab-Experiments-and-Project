<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Checkout | ShopSphere</title><style>
body{font-family:Arial;background:#f6f7fb;color:#172033;margin:0}.card{max-width:520px;margin:45px auto;background:white;padding:28px;border-radius:14px}
label{display:block;margin:16px 0 6px}input{width:100%;padding:12px;border:1px solid #cbd2e1;border-radius:8px;box-sizing:border-box}
button{background:#3157d5;color:white;border:0;border-radius:8px;padding:12px 18px;margin-top:18px;cursor:pointer}.error{color:#b42318}
</style></head><body><main class="card"><h1>Checkout</h1><p>This demo does not collect payment information or process real payments.</p>
<% if (request.getAttribute("error") != null) { %><p class="error"><%=request.getAttribute("error")%></p><% } %>
<form method="post" action="<%=request.getContextPath()%>/checkout">
<label for="name">Full name</label><input id="name" name="name" required maxlength="100">
<label for="email">Email</label><input id="email" name="email" type="email" required maxlength="160">
<button type="submit">Place demo order</button></form><p><a href="<%=request.getContextPath()%>/cart">Back to cart</a></p></main></body></html>
