<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.JDBC" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Data Barang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h2>Edit Data Barang</h2>
            </div>
            <div class="card-body">
                <%
                    JDBC db = new JDBC();
                    String id = request.getParameter("id");
                    String nama = "";
                    String deskripsi = "";
                    double harga = 0.0;
                    String message = "";

                    // Ambil data barang berdasarkan ID
                    if (id != null) {
                        try {
                            ResultSet rs = db.getBarangData();
                            if (rs.next()) {
                                nama = rs.getString("nama");
                                deskripsi = rs.getString("deskripsi");
                                harga = rs.getDouble("harga");
                            } else {
                                message = "Data barang tidak ditemukan!";
                            }
                        } catch (SQLException e) {
                            message = "Error: " + e.getMessage();
                        }
                    }

                    // Proses update jika form dikirim
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String newNama = request.getParameter("newNama");
                        String newDeskripsi = request.getParameter("newDeskripsi");
                        String newHargaStr = request.getParameter("newHarga");
                        
                        if (newNama != null && newDeskripsi != null && newHargaStr != null) {
                            try {
                                double newHarga = Double.parseDouble(newHargaStr);
                                int result = db.updateBarangData(Integer.parseInt(id), newNama, newDeskripsi, newHarga);
                                if (result > 0) {
                                    message = "Barang berhasil diperbarui!";
                                } else {
                                    message = "Gagal memperbarui barang.";
                                }
                            } catch (Exception e) {
                                message = "Error: " + e.getMessage();
                            }
                        }
                    }
                %>

                <% if (!message.isEmpty()) { %>
                    <div class="alert alert-info">
                        <p><%= message %></p>
                    </div>
                <% } %>

                <form action="edit.jsp" method="post" class="mt-3">
                    <input type="hidden" name="id" value="<%= id %>">

                    <div class="mb-3">
                        <label for="newNama" class="form-label">Nama Barang</label>
                        <input type="text" class="form-control" id="newNama" name="newNama" value="<%= nama %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="newDeskripsi" class="form-label">Deskripsi</label>
                        <input type="text" class="form-control" id="newDeskripsi" name="newDeskripsi" value="<%= deskripsi %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="newHarga" class="form-label">Harga</label>
                        <input type="number" class="form-control" id="newHarga" name="newHarga" step="0.01" value="<%= harga %>" required>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-success">Update Barang</button>
                        <a href="view.jsp" class="btn btn-warning">Kembali ke Daftar Produk</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
