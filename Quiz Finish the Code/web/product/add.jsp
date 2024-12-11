<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.JDBC" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tambah Data Barang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h2>Tambah Data Barang</h2>
            </div>
            <div class="card-body">
                <%
                    String nama = request.getParameter("nama");
                    String deskripsi = request.getParameter("deskripsi");
                    String harga = request.getParameter("harga");

                    if(nama != null && deskripsi != null && harga != null) {
                        try {
                            JDBC db = new JDBC();
                            if(db.isConnected) {
                                // Prepare the insert query using the JDBC runUpdateQuery method
                                String insertQuery = "INSERT INTO barang (nama, deskripsi, harga) VALUES ('" 
                                    + nama + "', '" + deskripsi + "', " + harga + ")";
                                db.runUpdateQuery(insertQuery);  // Execute the insert query

                                // Display success message
                                if (db.message.contains("rows affected")) {
                                    out.print("<div class='alert alert-success'>Data berhasil ditambahkan!</div>");
                                } else {
                                    out.print("<div class='alert alert-danger'>Gagal menambahkan data.</div>");
                                }
                            } else {
                                out.print("<div class='alert alert-danger'>Database connection failed: " + db.message + "</div>");
                            }
                        } catch (Exception e) {
                            out.print("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                        }
                    }
                %>

                <form action="add.jsp" method="post" class="mt-3">
                    <div class="mb-3">
                        <label for="nama" class="form-label">Nama Barang</label>
                        <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan nama barang" required>
                    </div>
                    <div class="mb-3">
                        <label for="deskripsi" class="form-label">Deskripsi</label>
                        <input type="text" class="form-control" id="deskripsi" name="deskripsi" placeholder="Masukkan deskripsi barang" required>
                    </div>
                    <div class="mb-3">
                        <label for="harga" class="form-label">Harga</label>
                        <input type="number" class="form-control" id="harga" name="harga" placeholder="Masukkan harga barang" required>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">Tambah Barang</button>
                        <a href="view.jsp" class="btn btn-warning">Kembali ke Daftar Produk</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
