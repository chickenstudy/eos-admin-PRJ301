<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Forgot Password</title>
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

            form {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #e14641;
            }

            label {
                display: block;
                margin-bottom: 10px;
                color: #555;
            }

            input[type=text], input[type=email], input[type=tel], select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-bottom: 10px;
                font-size: 16px;
                color: #333;
            }

            select {
                background-color: #fff;
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

            .error-message {
                color: #ff0000;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>

        <form method="post" action="forgotPassword">
            <h1>Forgot Password</h1>
            <% if (request.getAttribute("error") != null) { %>
            <p class="error-message"><%= request.getAttribute("error") %></p>
            <% } %>
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullName" required>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required>

            <label for="gender">Gender:</label>
            <select id="gender" name="gender">
                <option value="">Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>

            <br>
            <label for="email">Email:</label>
            <input type="email" placeholder="Email" name="email" class="forms_field-input" required oninvalid="this.setCustomValidity('Bạn cần điền đủ thông tin!')" oninput="setCustomValidity('')">

            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phoneNumber" pattern="[0-9]{10}" required>

            <input type="submit" value="Submit">
        </form>

    </body>
</html>