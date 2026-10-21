package com.shopsphere.dao;

import com.shopsphere.model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<Product> findAll() throws SQLException {
        String sql = "SELECT id, name, description, price, category, image_url, stock FROM products ORDER BY id";
        List<Product> products = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getBigDecimal("price"),
                        rs.getString("category"),
                        rs.getString("image_url"),
                        rs.getInt("stock")));
            }
        }
        return products;
    }

    public Product findById(int id) throws SQLException {
        String sql = "SELECT id, name, description, price, category, image_url, stock FROM products WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Product(rs.getInt("id"), rs.getString("name"),
                            rs.getString("description"), rs.getBigDecimal("price"),
                            rs.getString("category"), rs.getString("image_url"), rs.getInt("stock"));
                }
            }
        }
        return null;
    }
}
