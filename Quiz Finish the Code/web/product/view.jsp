<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.JDBC" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Data</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Daftar Barang</h2>
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nama</th>
                    <th>Deskripsi</th>
                    <th>Harga</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <%
                    JDBC db = new JDBC();
                    if(db.isConnectedBarang) {
                        try {
                            DecimalFormat df = new DecimalFormat("#,###,###.00");
                            ResultSet rs = db.getBarangData();
                            while(rs.next()) {
                                int id = rs.getInt("id");
                                String nama = rs.getString("Nama");
                                String deskripsi = rs.getString("Deskripsi");
                                double harga = rs.getDouble("harga");

                                String hargaFormatted = df.format(harga);

                                out.print("<tr>");
                                out.print("<td>" + id + "</td>");
                                out.print("<td>" + nama + "</td>");
                                out.print("<td>" + deskripsi + "</td>");
                                out.print("<td>" + hargaFormatted + "</td>");
                                out.print("<td>");
                                out.print("<a href='edit.jsp?id=" + id + "' class='btn btn-warning btn-sm'>Edit</a>");
                                out.print("</td>");
                                out.print("</tr>");
                            }
                        } catch (Exception e) {
                            out.print("<tr><td colspan='5' class='text-center text-danger'>" + e.getMessage() + "</td></tr>");
                        }
                    } else {
                        out.print("<tr><td colspan='5' class='text-center text-danger'>Database connection failed: " + db.messageBarang + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
        <div class="text-center">
            <a href="add.jsp" class="btn btn-primary">Add Product</a>
        </div>
    </div>
</body>
</html>
