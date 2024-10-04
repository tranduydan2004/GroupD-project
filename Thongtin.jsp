<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mywebapp.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giày-Phụ kiện</title>
    <link rel="stylesheet" type="text/css" href="styles/Trangchu.css">
    <link rel="stylesheet" type="text/css" href="styles/index.css">
</head>
<body>
<header>
    <div class="header-content">
        <img src="logo.png" alt="Cá Koi" class="img_header-thongtin">
        <h2><a href="index.jsp" class="home-link">Trang chủ</a></h2>
    </div>
    <nav>
        <ul>
            <%
                String username = (String) session.getAttribute("username");
                Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");

                if (username != null) {
            %>
            <li><a href="admin.jsp">Quản trị</a></li>
            <li><a href="Logout.jsp">Đăng xuất</a></li>
            <%
            } else {
            %>
            <li><a href="Login.jsp">Đăng nhập</a></li>
            <%
                }
            %>
            <li><a href="Hotro.jsp">Hỗ trợ</a></li>
        </ul>
    </nav>
</header>

<div id="notification"></div>

<%
    // Kết nối đến PostgreSQL
    String jdbcUrl = "jdbc:postgresql://localhost:5432/postgres";
    String usernameDB = "postgres";
    String passwordDB = "951236vu";

    List<Product> productsUnder50 = new ArrayList<>();
    List<Product> productsOver50 = new ArrayList<>();

    try {
        // Nạp driver PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Kết nối đến cơ sở dữ liệu
        try (Connection conn = DriverManager.getConnection(jdbcUrl, usernameDB, passwordDB)) {
            // Query for products under 50
            String sqlUnder50 = "SELECT * FROM products WHERE id < 50 ORDER BY id ASC";
            try (PreparedStatement pstmt = conn.prepareStatement(sqlUnder50);
                 ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImagePath(rs.getString("image_path1"));
                    productsUnder50.add(product);
                }
            }

            // Query for products over 50
            String sqlOver50 = "SELECT * FROM products WHERE id >= 50 ORDER BY id ASC";
            try (PreparedStatement pstmt = conn.prepareStatement(sqlOver50);
                 ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImagePath(rs.getString("image_path1"));
                    productsOver50.add(product);
                }
            }
        }
    } catch (ClassNotFoundException e) {
        out.println("Lỗi: Driver PostgreSQL không được tìm thấy. " + e.getMessage());
    } catch (SQLException e) {
        out.println("Lỗi kết nối cơ sở dữ liệu: " + e.getMessage());
    }

    // Store product lists in request attributes
    request.setAttribute("productsUnder50", productsUnder50);
    request.setAttribute("productsOver50", productsOver50);
%>

<div class="toc">
    <a href="#Ca">Thông tin Cá</a><br/>
    <a href="#Ho">Thông tin Hồ</a><br/>
</div>

<div class="main">
    <h2 class="DPS" >Thông tin Cá</h2>
    <div class="nhanvat" id="Ca">
        <%
            // Hiển thị danh sách sản phẩm dưới 50
            if (!productsUnder50.isEmpty()) {
                for (Product product : productsUnder50) {
        %>
        <div class="char2" onclick="showTooltip('<%= product.getPrice() %>', ['<%= product.getImagePath() %>'], 'tooltip<%= product.getId() %>')">
            <p><b><%= product.getName() %></b></p>
            <a onclick="updateSelectedProduct(<%= product.getId() %>)">
                <img src="<%= product.getImagePath() %>" class="avtchar" alt=""/>
            </a>
            <div class="tooltip" id="tooltip<%= product.getId() %>"></div>
        </div>
        <%
                }
            } else {
                out.println("Không tìm thấy sản phẩm.");
            }
        %>
    </div>
    <div class="chitiet">
        <a onclick="redirectToDetailPage()">Xem chi tiết<img src="block_more.f237bb12.png" class="block" alt=""/></a><br/>
    </div>

    <div class="spacer"></div> <!-- Khoảng trống -->

    <h2 class="DPS" >Thông tin Hồ</h2>
    <div class="nhanvat" id="Ho">
        <%
            // Hiển thị danh sách sản phẩm trên 50
            if (!productsOver50.isEmpty()) {
                for (Product product : productsOver50) {
        %>
        <div class="char2" onclick="showTooltip1('<%= product.getPrice() %>', ['<%= product.getImagePath() %>'], 'tooltip<%= product.getId() %>')">
            <p><b><%= product.getName() %></b></p>
            <a onclick="updateSelectedProduct1(<%= product.getId() %>)">
                <img src="<%= product.getImagePath() %>" class="avtchar" alt=""/>
            </a>
            <div class="tooltip1" id="tooltip<%= product.getId() %>"></div>
        </div>
        <%
                }
            } else {
                out.println("Không tìm thấy sản phẩm.");
            }
        %>
    </div>

    <div class="chitiet1">
        <a onclick="redirectToDetailPage1()">Xem chi tiết<img src="block_more.f237bb12.png" class="block" alt=""/></a><br/>
    </div>
</div>

<script>
    var selectedProductId;
    var selectedProductId1;

    // Function to update the selected product ID
    function updateSelectedProduct(productId) {
    selectedProductId = productId;
    }

    // Function to update the selected product ID
    function updateSelectedProduct1(productId1) {
    selectedProductId1 = productId1;
    }

    // Function to redirect to the detail page
    function redirectToDetailPage() {
    if (selectedProductId) {
    var detailsLink = "Chitiet.php?id=" + encodeURIComponent(selectedProductId);
    window.location.href = detailsLink;
    } else {
        alert("Vui lòng chọn một sản phẩm để xem chi tiết.");
        }
    }
    // Function to redirect to the detail page
    function redirectToDetailPage1() {
    if (selectedProductId1) {
        var detailsLink1 = "Chitiet.php?id=" + encodeURIComponent(selectedProductId1);
        window.location.href = detailsLink1;
    } else {
        alert("Vui lòng chọn một sản phẩm để xem chi tiết.");
        }
    }

    window.onload = function() {
        selectedProductId = 1;
        selectedProductId1 = 50;
    };
</script>
<%@ page import="java.sql.*, org.json.*" %>
<%
    String host = "localhost";
    String port = "5432";
    String dbname = "postgres";
    String user = "postgres";
    String password = "951236vu";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    JSONArray jsonArray = new JSONArray();

    try {
        // Kết nối CSDL
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://" + host + ":" + port + "/" + dbname;
        conn = DriverManager.getConnection(url, user, password);

        // Truy vấn dữ liệu
        String sql = "SELECT * FROM products WHERE id = 1 OR id = 50";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        // Lưu dữ liệu vào JSONArray
        while (rs.next()) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", rs.getInt("id"));
            jsonObject.put("name", rs.getString("name")); // Thay đổi 'name' theo cột của bạn
            jsonObject.put("price", rs.getDouble("price")); // Thay đổi 'price' theo cột của bạn
            jsonObject.put("image_path2", rs.getString("image_path2"));
            jsonObject.put("image_path3", rs.getString("image_path3"));
            // Thêm các cột khác nếu cần
            jsonArray.put(jsonObject);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Đóng kết nối
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }

    // Trả về dữ liệu dưới dạng JSON an toàn
    String jsonData = jsonArray.toString();
%>

<div id="jsonData" data-json='<%= jsonData.replace("'", "&apos;") %>'></div>

<script src="styles/Trangchu.js"></script>
<script src="styles/Sanpham.js"></script>
</body>
</html>
