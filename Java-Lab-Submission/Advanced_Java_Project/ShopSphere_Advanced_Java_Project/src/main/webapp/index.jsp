<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ShopSphere | Everyday finds</title>
  <style>
    *{box-sizing:border-box}body{margin:0;font-family:Arial,sans-serif;background:#f6f7fb;color:#172033}
    nav{display:flex;justify-content:space-between;align-items:center;padding:20px 7%;background:#fff}
    .brand{font-size:24px;font-weight:800;color:#3157d5}nav a{color:#172033;text-decoration:none;margin-left:18px}
    .hero{padding:76px 8%;background:linear-gradient(120deg,#e8edff,#fff);min-height:350px}
    .hero h1{font-size:clamp(36px,5vw,58px);max-width:620px;margin:0 0 18px}
    .hero p{font-size:18px;line-height:1.6;max-width:560px;color:#536078}
    .btn{display:inline-block;background:#3157d5;color:#fff!important;padding:13px 20px;border-radius:9px;text-decoration:none;margin-top:14px}
    .features{display:grid;grid-template-columns:repeat(auto-fit,minmax(190px,1fr));gap:18px;padding:28px 8%}
    .feature{background:#fff;padding:22px;border-radius:12px}
    footer{text-align:center;padding:24px;color:#68738a}
  </style>
</head>
<body>
<nav><div class="brand">ShopSphere</div><div><a href="products">Shop</a><a href="cart">Cart</a></div></nav>
<section class="hero">
  <h1>Everyday finds. A little more delightful.</h1>
  <p>Explore a simple demo storefront built with JSP, Servlets, JDBC and MySQL for an Advanced Java practical.</p>
  <a class="btn" href="products">Explore products →</a>
</section>
<section class="features">
  <div class="feature"><h3>Curated products</h3><p>Browse products loaded from the MySQL database.</p></div>
  <div class="feature"><h3>Simple cart</h3><p>Add and remove items using a session-based cart.</p></div>
  <div class="feature"><h3>Java web stack</h3><p>Learn JSP, Servlets, DAO, JDBC and MVC-style structure.</p></div>
</section>
<footer>ShopSphere • Advanced Java Educational Project</footer>
</body>
</html>
