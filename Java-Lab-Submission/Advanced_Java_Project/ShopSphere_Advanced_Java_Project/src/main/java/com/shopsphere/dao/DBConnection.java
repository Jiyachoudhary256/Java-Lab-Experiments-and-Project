package com.shopsphere.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DBConnection {
    private static final String DB_URL =
            System.getenv().getOrDefault("SHOPSPHERE_DB_URL",
                    "jdbc:mysql://localhost:3306/shopsphere?useSSL=false&serverTimezone=UTC");
    private static final String DB_USER =
            System.getenv().getOrDefault("SHOPSPHERE_DB_USER", "root");
    private static final String DB_PASSWORD =
            System.getenv().getOrDefault("SHOPSPHERE_DB_PASSWORD", "change_me");

    private DBConnection() {}

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}
