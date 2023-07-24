<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Reset Password</title>
        <style>
            body {
                background-image: url('./picture/HUY_9340.jpg');
                background-size: cover;
                background-position: center;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            h1 {
                text-align: center;
                color: #e14641;
            }

            form {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            }

            label {
                display: block;
                margin-bottom: 10px;
                color: #555;
            }

            input[type=password] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-bottom: 10px;
                font-size: 16px;
                color: #333;
            }

            input[type=submit] {
                background-color: #e14641;
                color: #fff;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 10px;
                width: 100%;
            }

            input[type=submit]:hover {
                background-color: #c53c31;
            }

            p {
                color: #ff0000;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>

        <h1>Reset Password</h1>

        <%
        String email = (String) request.getAttribute("email");
        %>


        <form method="post" action="resetPassword">
            <input type="hidden" name="email" value="<%=email%>">
            <label for="newPassword">New Password:</label><br>
            <input type="password" id="newPassword" name="newPassword"><br><br>
            <% if (request.getAttribute("error confirm") != null) { %>
            <p><%= request.getAttribute("error confirm") %></p>
            <% } %>
            <label for="confirmPassword">Confirm Password:</label><br>
            <input type="password" id="confirmPassword" name="confirmPassword"><br><br>
            <% if (request.getAttribute("error") != null) { %>
            <p><%= request.getAttribute("error") %></p>
            <% } %>
            <input type="submit" value="Submit">
        </form>

    </body>
</html>