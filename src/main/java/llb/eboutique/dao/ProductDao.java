package llb.eboutique.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import llb.eboutique.model.Product;

public class ProductDao {
    private Connection con;

    public ProductDao(Connection con) {
        this.con = con;
    }

    // Ajouter un produit
    public boolean addProduct(Product product) {
        boolean result = false;
        String query = "INSERT INTO product (name, description, price, image_url, category_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pst = this.con.prepareStatement(query)) {
            pst.setString(1, product.getName());
            pst.setString(2, product.getDescription());
            pst.setDouble(3, product.getPrice());
            pst.setString(4, product.getImageUrl());
            pst.setLong(5, product.getCategoryId());
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Récupérer un produit par ID
    public Product getProductById(long id) {
        Product product = null;
        String query = "SELECT * FROM product WHERE id = ?";
        try (PreparedStatement pst = this.con.prepareStatement(query)) {
            pst.setLong(1, id);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setId(rs.getLong("id"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImageUrl(rs.getString("image_url"));
                    product.setCategoryId(rs.getLong("category_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    // Récupérer tous les produits
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM product";
        try (PreparedStatement pst = this.con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getLong("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setImageUrl(rs.getString("image_url"));
                product.setCategoryId(rs.getLong("category_id"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Mettre à jour un produit
    public boolean updateProduct(Product product) {
        boolean result = false;
        String query = "UPDATE product SET name = ?, description = ?, price = ?, image_url = ?, category_id = ? WHERE id = ?";
        try (PreparedStatement pst = this.con.prepareStatement(query)) {
            pst.setString(1, product.getName());
            pst.setString(2, product.getDescription());
            pst.setDouble(3, product.getPrice());
            pst.setString(4, product.getImageUrl());
            pst.setLong(5, product.getCategoryId());
            pst.setLong(6, product.getId());
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Supprimer un produit
    public boolean deleteProduct(long id) {
        boolean result = false;
        String query = "DELETE FROM product WHERE id = ?";
        try (PreparedStatement pst = this.con.prepareStatement(query)) {
            pst.setLong(1, id);
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
