# ShopSphere — Advanced Java Mini Project

A beginner-friendly shopping website demo for an Advanced Java practical using **JSP, Servlets, JDBC, and MySQL**.

## Features
- Product listing from MySQL
- Add products to a session-based cart
- View cart and remove items
- Simple checkout form
- MVC-style separation: JSP views, Servlets/controllers, DAO, model
- Prepared statements for database queries

> This is an educational demo, not a production-ready store. Checkout does not process real payments. Passwords, payment details, and personal data should not be added to this demo.

## Requirements
- JDK 17+
- Apache Maven 3.9+
- Apache Tomcat 10.1+
- MySQL 8+
- MySQL Workbench or MySQL Command Line Client

This project uses `jakarta.servlet.*` and `jakarta.servlet.jsp.*`, so use **Tomcat 10.1+**, not Tomcat 9.

## 1. Create the database
Open MySQL and run the script in `database/shopsphere.sql`.

Example command:
```sql
SOURCE C:/path/to/ShopSphere_Advanced_Java_Project/database/shopsphere.sql;
```
Or open the SQL file in MySQL Workbench and execute it.

The script creates database `shopsphere` and sample products. It creates no database user and sets no password.

## 2. Configure your MySQL connection
Open:
`src/main/java/com/shopsphere/dao/DBConnection.java`

Update `DB_URL`, `DB_USER`, and `DB_PASSWORD` to match your local MySQL configuration. Never commit a real password to a public repository; for college submission, use a local-only config or environment variables.

## 3. Build
Open CMD in the project root (the folder containing `pom.xml`) and run:
```bat
mvn clean package
```
Expected output: `target/shopsphere.war`.

## 4. Deploy to Tomcat
1. Stop Tomcat.
2. Copy `target\shopsphere.war` into Tomcat's `webapps` directory.
3. Start Tomcat.
4. Open `http://localhost:8080/shopsphere/`.

If Tomcat runs on another port, replace `8080`.

## 5. GitHub upload
Create a new repository on GitHub, e.g. `ShopSphere-Advanced-Java`, then run these commands from the project root:
```bat
git init
git add .
git commit -m "Add ShopSphere Advanced Java project"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/ShopSphere-Advanced-Java.git
git push -u origin main
```
Replace `YOUR-USERNAME` and use the exact URL shown by GitHub. Git must be installed and authenticated.

## Troubleshooting
- `mvn is not recognized`: Maven's `bin` folder is not in PATH.
- `JAVA_HOME is not defined correctly`: set `JAVA_HOME` to the actual JDK folder, not the `bin` folder.
- `Access denied for user`: correct DB user/password in `DBConnection.java`.
- `Unknown database shopsphere`: run `database/shopsphere.sql`.
- `Table doesn't exist`: confirm you executed the full SQL script against the `shopsphere` database.
- HTTP 404: confirm the WAR deployed, Tomcat started, and context path is `/shopsphere`.

## Project structure
```text
ShopSphere_Advanced_Java_Project/
├── pom.xml
├── README.md
├── database/shopsphere.sql
└── src/main/
    ├── java/com/shopsphere/
    │   ├── controller/
    │   ├── dao/
    │   └── model/
    └── webapp/
        ├── index.jsp
        ├── products.jsp
        ├── cart.jsp
        └── WEB-INF/web.xml
```
