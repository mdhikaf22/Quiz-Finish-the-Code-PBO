<%-- 
    Document   : register.jsp
    Created on : Dec 11, 2024, 10:01:31 PM
    Author     : ASUS
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrasi Pengguna</title>
</head>
<body>
    <h2>Form Registrasi</h2>
    <form action="../RegisterServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <input type="submit" value="Daftar">
    </form>

    <p>Sudah punya akun? <a href="login.jsp">Login disini</a></p>
</body>
</html>
