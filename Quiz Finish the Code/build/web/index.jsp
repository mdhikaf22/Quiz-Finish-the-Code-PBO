<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Barang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-5 text-center">
            <h1>Selamat datang di Data Barang</h1>
            <p>Silakan pilih salah satu opsi di bawah ini:</p>

            <!-- Tombol Login -->
            <a href="product/login.jsp" class="btn btn-primary mb-2">Login</a>

            <!-- Tombol Registrasi -->
            <a href="product/register.jsp" class="btn btn-secondary mb-2">Registrasi</a>

            <!-- Tombol Ke Halaman View -->
            <p>Jika Anda sudah login, klik tombol berikut untuk melihat data barang:</p>
            <a href="product/view.jsp" class="btn btn-info">Ke Halaman View</a>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
