package classes;

import java.sql.*;

public class JDBC {
    private Connection conBarang; // Koneksi ke database db_barang
    private Connection conUser;   // Koneksi ke database db_user
    public boolean isConnectedBarang;
    public boolean isConnectedUser;
    public String messageBarang;
    public String messageUser;

    // Constructor untuk menghubungkan ke kedua database
    public JDBC() {
        try {
            // Koneksi ke database db_barang
            Class.forName("com.mysql.cj.jdbc.Driver");
            conBarang = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_barang", "root", "");
            isConnectedBarang = true;
            messageBarang = "Connected to db_barang successfully!";
        } catch (Exception e) {
            isConnectedBarang = false;
            messageBarang = "Error connecting to db_barang: " + e.getMessage();
        }

        try {
            // Koneksi ke database db_user
            conUser = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "");
            isConnectedUser = true;
            messageUser = "Connected to db_user successfully!";
        } catch (Exception e) {
            isConnectedUser = false;
            messageUser = "Error connecting to db_user: " + e.getMessage();
        }
    }

    // Metode untuk menutup koneksi ke kedua database
    public void disconnect() {
        try {
            if (conBarang != null) conBarang.close();
            if (conUser != null) conUser.close();
            System.out.println("Both databases disconnected successfully!");
        } catch (Exception e) {
            System.out.println("Error disconnecting databases: " + e.getMessage());
        }
    }

    // Metode untuk insert data ke tabel users (db_user)
    public int registerUser(String username, String password, String email) {
        try {
            String query = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conUser.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, email);
            return pstmt.executeUpdate(); // Mengembalikan jumlah baris yang terpengaruh
        } catch (SQLException e) {
            System.out.println("Error registering user: " + e.getMessage());
            return 0;
        }
    }

    // Metode untuk verifikasi login pengguna (db_user)
    public boolean isValidUser(String username, String password) {
        try {
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement pstmt = conUser.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            return rs.next(); // Jika ada data pengguna, maka valid
        } catch (SQLException e) {
            System.out.println("Error verifying user: " + e.getMessage());
            return false;
        }
    }

    // Metode untuk insert data barang (db_barang)
    public int addBarang(String nama, String deskripsi, double harga) {
        try {
            String query = "INSERT INTO barang (nama, deskripsi, harga) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conBarang.prepareStatement(query);
            pstmt.setString(1, nama);
            pstmt.setString(2, deskripsi);
            pstmt.setDouble(3, harga);
            return pstmt.executeUpdate(); // Mengembalikan jumlah baris yang terpengaruh
        } catch (SQLException e) {
            System.out.println("Error adding barang: " + e.getMessage());
            return 0;
        }
    }
    
    public int updateBarangData(int id, String nama, String deskripsi, double harga){
        try {
            String query = "UPDATE barang SET nama = ?, deskripsi = ?, harga = ? WHERE id = ?";
            PreparedStatement pstmt = conBarang.prepareStatement(query);
            pstmt.setString(1, nama);
            pstmt.setString(2, deskripsi);
            pstmt.setDouble(3, harga);
            pstmt.setInt(4, id);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating barang data: " + e.getMessage());
        return 0; // Jika gagal, kembalikan 0
        }
        
    }
    
    // Metode untuk mengambil data barang (db_barang)
    public ResultSet getBarangData() throws SQLException {
        String query = "SELECT * FROM barang ";
        Statement stmt = conBarang.createStatement();
        return stmt.executeQuery(query);
    }

    // Metode untuk mengambil data pengguna berdasarkan username (db_user)
    public ResultSet getUserDataByUsername(String username) throws SQLException {
        String query = "SELECT * FROM users WHERE username = ?";
        PreparedStatement pstmt = conUser.prepareStatement(query);
        pstmt.setString(1, username);
        return pstmt.executeQuery();
    }
}
