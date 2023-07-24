<%@page import="model.*" import="dao.*" import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
crossorigin="anonymous"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    body{
        background-color: #3333330a;
    }
    a {
        text-decoration: none;
        color: black
    }
</style>
<nav class="navbar bg-secondary">
    <div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">User Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    <!--<button type="button" onclick="updateUser()" style="position: relative; left: -83px; top: 233px;" class="btn btn-primary">Update</button>-->
                </div>
                <div class="modal-body">
                    <%User user=(User) request.getSession().getAttribute("user");%>
                    <table>
                        <tr>
                            <th>Full Name:</th>
                            <td id="fullName"><%= user.getFullName()%></td>
                        </tr>
                         <tr>
                            <th>Password:</th>
                            <td id="fullName"><%= user.getPassword()%></td>
                        </tr>
                        <tr>
                            
                            <th>Date of Birth:</th>
                            <td id="dob"><%= user.getDob()%></td>
                        </tr>
                        <tr>
                            <th>Gender:</th>
                            <td id="gender"><%= user.getGender()%></td>
                        </tr>
                        <tr>
                            <th>Email:</th>
                            <td id="email"><%= user. getEmail()%></td>
                        </tr>
                        <tr>
                            <th>Phone Number:</th>
                            <td id="phone_number"><%= user.getNumberPhone()%></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
        
           
    </div>
    <div class="container-fluid">
        <!--        <div class="d-flex align-items-center">
        
                    <a class="" href="./course">
                        <h3>Home</h3>
                    </a>
                </div >-->
        <button type="button" style="text-decoration: none;color: black; font-size: 18px; line-height: 32px; font-weight: 600;" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#userModal">
                        User Info 
        </button>
        <div class="d-flex" >
            <a href="./course" class="px-3">
                <h4>Course</h4>
            </a>

        </div>



        <div class="d-flex" >
            <%  if (user==null) {
                 response.sendRedirect(request.getContextPath()+"/login"); return; } else {  %>
            <a class="dropdown-item" href="<%= request.getContextPath()%>/logout"> <h5>Logout </h5> </a>
            <%}%>
        </div
    </div>
</nav>





