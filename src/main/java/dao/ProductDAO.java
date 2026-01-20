package dao;

import model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private String jdbcURL =
            "jdbc:mysql://localhost:3306/shop_db"
                    + "?useSSL=false"
                    + "&allowPublicKeyRetrieval=true"
                    + "&serverTimezone=UTC"
                    + "&characterEncoding=utf8";

    private String jdbcUsername = "root";
    private String jdbcPassword = "";


    private static final String SELECT_ALL = "SELECT * FROM products";
    private static final String SELECT_BY_ID = "SELECT * FROM products WHERE id=?";
    private static final String INSERT = "INSERT INTO products(name, price, url_image) VALUES (?, ?, ?)";
    private static final String UPDATE = "UPDATE products SET name=?, price=?, url_image=? WHERE id=?";
    private static final String DELETE = "DELETE FROM products WHERE id=?";

    protected Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Product> selectAllProducts() throws Exception {
        List<Product> products = new ArrayList<>();
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(SELECT_ALL);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            products.add(new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("url_image")
            ));
        }
        conn.close();
        return products;
    }

    public Product selectProduct(int id) throws Exception {
        Product product = null;
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            product = new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("url_image")
            );
        }
        conn.close();
        return product;
    }

    public void insertProduct(Product product) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(INSERT);
        ps.setString(1, product.getName());
        ps.setDouble(2, product.getPrice());
        ps.setString(3, product.getUrl_image());
        ps.executeUpdate();
        conn.close();
    }

    public void updateProduct(Product product) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(UPDATE);
        ps.setString(1, product.getName());
        ps.setDouble(2, product.getPrice());
        ps.setString(3, product.getUrl_image());
        ps.setInt(4, product.getId());
        ps.executeUpdate();
        conn.close();
    }

    public void deleteProduct(int id) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(DELETE);
        ps.setInt(1, id);
        ps.executeUpdate();
        conn.close();
    }
}
