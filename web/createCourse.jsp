

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
    </head>
    <body>
        <%@include file="./layout.jsp"  %>
        <div class="d-flex justify-content-center my-3">
            <h1 class="mx-auto">Course</h1>
        </div>
        <div class="container bg-white p-3">
            <div class="side-nav-categories">
                <form id="form" action="course-create" method="POST">
                    <div class="my-3">
                        <h3 class="title-name">Name</h3>
                        <input class="text-name" type="text" required maxlength="50" placeholder="Name..." name="name" >
                    </div>
                    <div class="my-3">
                        <h3 class="title-name">Description</h3>
                        <input class="text-name" type="text"  placeholder="Description..." name="description" >
                    </div>
                    <input type="submit" class="btn btn-primary"  style="font-family: serif;color: #fff;" value="Create" >
                </form>
            </div>
        </div>
    </body>
</html>
