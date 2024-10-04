package com.mywebapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username != null) {
            try {
                Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT isadmin FROM users WHERE username = ?");
                stmt.setString(1, username);
                ResultSet rs = stmt.executeQuery();

                boolean isAdmin = false;
                if (rs.next()) {
                    isAdmin = rs.getBoolean("isadmin");
                }

                request.setAttribute("isAdmin", isAdmin);
                request.setAttribute("username", username);

                // Get user info
                PreparedStatement userStmt = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
                userStmt.setString(1, username);
                ResultSet userRs = userStmt.executeQuery();

                if (userRs.next()) {
                    request.setAttribute("userInfo", userRs);
                }

                userRs.close();
                userStmt.close();
                rs.close();
                stmt.close();
                conn.close();

                request.getRequestDispatcher("Trangchu.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("Login.jsp");
        }
    }

    private Connection getConnection() throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String password = "951236vu";
        return DriverManager.getConnection(url, user, password);
    }
}
