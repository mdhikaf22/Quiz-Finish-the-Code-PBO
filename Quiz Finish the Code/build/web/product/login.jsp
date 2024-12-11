<%-- 
    Document   : login
    Created on : Dec 11, 2024, 10:01:51 PM
    Author     : ASUS
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Pengguna</title>
</head>
<body>
    <h2>Form Login</h2>
    <form action="../LoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Login">
    </form>

    <p>Belum punya akun? <a href="register.jsp">Daftar disini</a></p>
</body>
</html>
