

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
<!--            <h1 class="mx-auto">Course</h1>-->
        </div>

        <!--        //detail-->
        <div class="container bg-white p-3">
            <div class="side-nav-categories">
                <form id="form" action="course-update" method="Post">
                    <input type="hidden" name="id" value="${id}">
                    <div class="my-3">
                        <h3 class="title-name">Name</h3>
                        <input class="text-name" type="text" required maxlength="50" placeholder="Name..." name="name" value="${course.name}" >
                    </div>
                    <div class="my-3">
                        <h3 class="title-name">Description</h3>
                        <input class="text-name" type="text"  placeholder="Description..." name="description" value="${course.description}" >
                    </div>
                    <input type="submit" class="btn btn-primary"  style="font-family: serif;color: #fff;" value="Update" >
                </form>
            </div>
        </div>
        <!--list test-->
        <div class="container bg-white p-3 my-3" >
            <div class="d-flex justify-content-center my-3">
                <h1 class="mx-auto">Test</h1>
            </div>
            <form action="course-detail" class="d-flex" role="search">
                <a class="btn btn-info" href="test-create?idCourse=${id}" role="button">Create</a>
                <input type="hidden" name="id" value="${id}">      
                <input type="hidden" name="pageQuestion" value="${pageQuestion}">
                <input type="hidden" name="searchQuestion" value="${searchQuestion}">
                <input name="searchTest" class="form-control mx-2" type="text" placeholder="Enter Name" aria-label="Search" value="${searchTest}" required="" maxlength="100">
                <button class="btn btn-success" type="submit">Search</button>
            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Time</th>
                        <th scope="col">Number Question</th>
                        <th scope="col">Total Question</th>
                        <th scope="col"> </th>

                    </tr>
                </thead>
                <tbody>
                    <c:set var="i" value="0"></c:set>
                    <c:forEach items="${listTest}" var="o">
                        <c:set var="i" value="${i+1}"></c:set>
                            <tr>
                                <th >${i}</th>        
                            <th >${o.name}</th>
                            <th >${o.description}</th>
                            <th >${o.time}</th> 
                            <th >${o.numberQuestion}</th> 
                            <th >${o.totalQuestion}</th> 
                            <th > 
                                <a class="btn btn-info" href="test-detail?id=${o.id}" role="button">Detail</a>                          
                                <c:if test="${o.totalQuestion == 0}">
                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${o.id}">Delete</button>
                                    <div class="modal fade" id="exampleModal${o.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Delete confirm</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Do you agree to delete Test ?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <a class="btn btn-danger" href="test-delete?id=${o.id}&idCourse=${id}" role="button">Delete</a>
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
            <c:if test="${totalTest >0}">
                <div class="paging">
                    <nav class="mt-4" aria-label="Page navigation sample">
                        <ul class="pagination justify-content-center">
                            <c:if test="${pageTest != 1}">
                                <li class="page-item"><a class="page-link" href="course-detail?id=${id}&pageTest=${pageTest -1}&searchTest=${searchTest}&pageQuestion=${pageQuestion}&searchQuestion=${searchQuestion}">Previous</a></li>
                                </c:if>
                            <li class="page-item active"><a class="page-link" href="course-detail?id=${id}&pageTest=${pageTest}&searchTest=${searchTest}&pageQuestion=${pageQuestion}&searchQuestion=${searchQuestion}">${pageTest}</a></li>
                                <c:if test="${ pageTest != totalTest}">
                                <li class="page-item"><a class="page-link" href="course-detail?id=${id}&pageTest=${pageTest +1}&searchTest=${searchTest}&pageQuestion=${pageQuestion}&searchQuestion=${searchQuestion} "">Next</a></li>
                                </c:if>
                        </ul>
                    </nav>
                </div>  
            </c:if>
        </div>   
        <!--list question-->
        <div class="container bg-white p-3 my-3" >
            <div class="d-flex justify-content-center my-3">
                <h1 class="mx-auto">Question</h1>
            </div>
            <div class="container  p-3 my-3" style="background-color: #3333332e;">
                <form id="form" action="question-create" method="post">
                    <input type="hidden" name="idCourse" value="${course.id}">
                    <div class="my-2">
                        <h6 class="title-name">Question</h6>
                        <textarea class="form-control"  rows="3" name="question" required></textarea>
                    </div>
                    <div class="d-flex justify-content-between align-items-center" >
                        <div class="my-2" style="width: 30%">
                            <h6 class="title-name">Answer A</h6>
                            <textarea class="form-control"  name="optionA" required></textarea>
                        </div>
                        <div class="my-2" style="width: 30%">
                            <h6 class="title-name">Answer B</h6>
                            <textarea class="form-control"  name="optionB" required></textarea>
                        </div>
                        <div class="my-2" style="width: 30%">
                            <h6 class="title-name">Answer C</h6>
                            <textarea class="form-control"  name="optionC" required></textarea>
                        </div> 
                        <div class="my-2" style="width: 30%">
                            <h6 class="title-name">Answer D</h6>
                            <textarea class="form-control"  name="optionD" required></textarea>
                        </div> 
                    </div>
                    <div class="my-2">
                        <h6 class="title-name">Right Answer</h6>
                        <select class="form-select" required name="rightOption">
                            <option value="1">Answer A</option>
                            <option value="2">Answer B</option>
                            <option value="3">Answer C</option>
                            <option value="4">Answer D</option>
                        </select>
                    </div>  
                    <input type="submit" class="btn btn-info"  value="Create" >
                </form>
            </div>
                    
            <p>Search Questions:</p>
            
            <form action="course-detail" class="d-flex" role="search">

                <input type="hidden" name="id" value="${id}">      
                <input type="hidden" name="pageTest" value="${pageTest}">
                <input type="hidden" name="searchTest" value="${searchTest}">
                <input name="searchQuestion" class="form-control mx-2" type="text" placeholder="Enter Name" aria-label="Search" value="${searchQuestion}" required="" maxlength="100">
                <button class="btn btn-success" type="submit">Search</button>
            </form>
            <div>
                <c:forEach items="${listQuestion}" var="o">
                    <div class="container  p-3 my-3" style="background-color: #3333332e">
                        <form id="form" action="question-update" method="post">
                            <input type="hidden" name="idCourse" value="${id}">      
                            <input type="hidden" name="id" value="${o.id}">
                            <div class="my-2">
                                <h6 class="title-name">Question</h6>
                                <textarea class="form-control" rows="3" placeholder="Question" name="question" required>${o.question}</textarea>
                            </div>
                            <div class="d-flex justify-content-between align-items-center" >
                                <div class="my-2" style="width: 30%">
                                    <h6 class="title-name">Answer A</h6>
                                    <textarea class="form-control" name="optionA" placeholder="Question" required>${o.optionA}</textarea>
                                </div>
                                <div class="my-2" style="width: 30%">
                                    <h6 class="title-name">Answer B</h6>
                                    <textarea class="form-control" name="optionB" placeholder="Question" required>${o.optionB} </textarea>
                                </div>
                                <div class="my-2" style="width: 30%">
                                    <h6 class="title-name">Answer C</h6>
                                    <textarea class="form-control" name="optionC" placeholder="Question" required>${o.optionC}</textarea>
                                </div> 
                                <div class="my-2" style="width: 30%">
                                    <h6 class="title-name">Answer D</h6>
                                    <textarea class="form-control" name="optionD" placeholder="Question" required>${o.optionD}</textarea>
                                </div> 
                            </div>
                            <div class="my-2">     ${o.rightOption == "4"? "active":""}  
                                <h6 class="title-name" >Right Answer</h6>
                                <select class="form-select" required name="rightOption" value=""${o.rightOption}>
                                    <option value="1"  ${o.rightOption == "1"? "selected":""}>Answer A</option>
                                    <option value="2"  ${o.rightOption == "2"? "selected":""}>Answer B</option>
                                    <option value="3"  ${o.rightOption == "3"? "selected":""}>Answer C</option>
                                    <option value="4"  ${o.rightOption == "4"? "selected":""}>Answer D</option>
                                </select>
                            </div>  
                            <input type="submit" class="btn btn-primary" value="Update" >
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${o.id}">Delete</button>
                            <div class="modal fade" id="exampleModal${o.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Delete confirm</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Do you agree to detete Question ?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <a class="btn btn-danger" href="question-delete?id=${o.id}&idCourse=${id}" role="button">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>
            <c:if test="${totalQuestion >0}">
                <div class="paging">
                    <nav class="mt-4" aria-label="Page navigation sample">
                        <ul class="pagination justify-content-center">
                            <c:if test="${pageQuestion != 1}">
                                <li class="page-item"><a class="page-link" href="course-detail?id=${id}&pageTest=${pageTest}&searchTest=${searchTest}&pageQuestion=${pageQuestion-1}&searchQuestion=${searchQuestion}">Previous</a></li>
                                </c:if>
                            <li class="page-item active"><a class="page-link" href="course-detail?id=${id}&pageTest=${pageTest}&searchTest=${searchTest}&pageQuestion=${pageQuestion}&searchQuestion=${searchQuestion}">${pageQuestion}</a></li>
                                <c:if test="${ pageQuestion != totalQuestion }">
                                <li class="page-item"><a class="page-link" href="course-detail?id=${id}&pageTest=${pageTest}&searchTest=${searchTest}&pageQuestion=${pageQuestion+1}&searchQuestion=${searchQuestion} "">Next</a></li>
                                </c:if>
                              
                        </ul>
                    </nav>
                </div>
            </c:if>
        </div>
        
    </body>
</html>
