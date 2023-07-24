

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
            <h1 class="mx-auto">Test</h1>
        </div>
        <div class="container bg-white p-3">
            <div class="side-nav-categories">
                <form id="form" action="test-create" method="POST">
                    <div class="my-3">
                        <h3 class="title-name">Name</h3>
                        <input class="text-name" type="text" required maxlength="50" placeholder="Name..." name="name" >
                    </div>
                    <div class="my-3">
                        <h3 class="title-name">Description</h3>
                        <input class="text-name" type="text" name="description" >
                    </div>
                    <div class="my-3">
                        <h3 class="title-name">Time</h3>
                        <input class="text-name" type="text" required name="time" > hour
                    </div>
                    <div class="my-3">
                        <h3 class="title-name">Number Question</h3>
                        <input class="text-name" type="text" required name="numberQuestion" >
                    </div>
                    <div class="my-3">
                        <h3 class="title-name">Course</h3>
                        
                        <select class="form-select" required name="idCourse" disabled="disabled">
                            <c:forEach items="${listCourses}" var="tsc">
                                <option value="${tsc.id}" ${tsc.id eq idCourse ? "selected" : ""} >${tsc.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <input type="submit" class="btn btn-primary"  style="font-family: serif;color: #fff;" value="Create" >
                </form>
            </div>
        </div>
    </body>
</html>
