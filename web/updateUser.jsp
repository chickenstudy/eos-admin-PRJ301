

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="updateUser">
            <h1> Update User</h1>
            <div>Full name: <input type="text" name="full_name"value="full_name"></div>
            <div>Password: <input type="text" name="password"  ></div>
            <div>Date of birth: <input type="text" name="dob" ></div>
            <div> <label for="gender">Gender:</label>
                <select id="gender" placeholder="Gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select></div>
            <div>Email: <input type="text" name="email" ></div>
            <div>Phone number: <input type="text" name="phone_number" ></div>
            <div> <button>Update</button></div>
        </form>
    </body>
</html>
