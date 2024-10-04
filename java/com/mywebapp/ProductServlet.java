package com.mywebapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Product> productsUnder50 = getProducts("SELECT * FROM products WHERE id < 50 ORDER BY id ASC");
            List<Product> productsOver50 = getProducts("SELECT * FROM products WHERE id >= 50 ORDER BY id ASC");

            request.setAttribute("productsUnder50", productsUnder50);
            request.setAttribute("productsOver50", productsOver50);

            request.getRequestDispatcher("Trangchu.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private List<Product> getProducts(String query) throws SQLException {
        List<Product> products = new ArrayList<>();
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Product product = new Product();
                products.add(product);
            }
        }
        return products;
    }

    private Connection getConnection() throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String password = "951236vu";
        return DriverManager.getConnection(url, user, password);
    }
}
