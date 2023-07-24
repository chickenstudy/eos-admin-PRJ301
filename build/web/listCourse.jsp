

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
    </head>
    <body>
        <%@include file="./layout.jsp"  %>
        <div class="d-flex justify-content-center my-3">
<!--            <h1 class="mx-auto">Course</h1>-->
        </div>
        <div class="container bg-white p-3" >
            <form action="course" class="d-flex" role="search">
                <a class="btn btn-info" href="course-create" role="button">Create</a>
                <input name="search" class="form-control mx-2" type="text" placeholder="Enter Name" aria-label="Search" value="${search}" required="" maxlength="100">
                <button class="btn btn-success" type="submit">Search</button>
            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Total Test </th>        
                        <th scope="col">Total Question</th>
                        
                        <th scope="col"></th>

                    </tr>
                </thead>
                <tbody>
                    <c:set var="i" value="0"></c:set>
                    <c:forEach items="${list}" var="o">
                        <c:set var="i" value="${i+1}"></c:set>
                            <tr>
                                <th >${i}</th>        
                            <th >${o.name}</th>
                            <th >${o.description}</th>
                            <th >${o.totalTest}</th> 
                            <th >${o.totalQuestion}</th>
                            <th > 
                                <a class="btn btn-info" href="course-detail?id=${o.id}" role="button">Detail</a>                          
                                <c:if test="${o.totalTest == 0 && o.totalQuestion == 0}">
                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${o.id}">Delete</button>
                                    <div class="modal fade" id="exampleModal${o.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Delete confirm</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Do you agree to delete product ?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <a class="btn btn-danger" href="course-delete?id=${o.id}" role="button">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </th>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${total >0}">
                <div class="paging">
                    <nav class="mt-4" aria-label="Page navigation sample">
                        <ul class="pagination justify-content-center">
                            <c:if test="${page != 1}">
                                <li class="page-item"><a class="page-link" href="course?page=${page -1}&search=${search}">Previous</a></li>
                                </c:if>
                            <li class="page-item active"><a class="page-link" href="course?page=${page}&search=${search}">${page}</a></li>
                                <c:if test="${ page != total}">
                                <li class="page-item"><a class="page-link" href="course?page=${page +1}&search=${search}">Next</a></li>
                                </c:if>
                        </ul>
                    </nav>
                </div>  
            </c:if>
        </div>          
    </body>
</html>
