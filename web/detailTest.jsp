

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
       
    </head>
    <body>
        <%@include file="./layout.jsp"  %>

        <!--//detail-->
        <div class="d-flex justify-content-center my-3">
            <h1 class="mx-auto">Test</h1>
        </div>
        <div class="container bg-white p-3">
            <div class="side-nav-categories">
                <form id="form" action="test-update" method="POST">
                    <input class="text-name" hidden type="text" required  name="id" value="${test.id}" >

                    <div class="my-3">
                        <h3 class="title-name">Name</h3>
                        <input class="text-name" type="text" required maxlength="50" placeholder="Name..." name="name" value="${test.name}" >
                    </div>
                    <div class="my-3">
                        <h3 class="title-name">Description</h3>
                        <input class="text-name" type="text" name="description" value="${test.description}" >
                    </div>
                    <div class="my-3">
                        <h3 class="title-name">Time</h3>
                        <input class="text-name" type="text" required name="time" value="${test.time}" > hour
                    </div>
                    <div class="my-3">
                        <h3 class="title-name">Number Question</h3>
                        <input class="text-name" type="text" required name="numberQuestion" value="${test.numberQuestion}" >
                    </div>
                    <div class="my-3">
                        <h3 class="title-name">Course</h3>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
                        <select class="form-select" required name="idCourse" disabled="disabled">
                            <c:forEach items="${listCourses}" var="tsc">
                                <option value="${tsc.id}" ${tsc.id eq test.idCourse ? "selected" : ""}>${tsc.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <input type="submit" class="btn btn-info"  style="font-family: serif;color: #fff;" value="Update" >
                </form>
            </div>
            <div class="d-flex justify-content-center my-3">
                <h2 class="mx-auto">Add Test</h2>
            </div>
            <form id="form" action="test-create-question" class="d-flex" method="POST">
                <input class="text-name" hidden type="text" required  name="idTest" value="${test.id}" >
                <select class="form-select " required name="idQuestion">
                    <c:forEach items="${questions}"   var="tsc">
                        <option value="${tsc.id}" >${tsc.question}</option>
                    </c:forEach>
                    <input type="submit" class="btn btn-info mx-2"  style="font-family: serif;color: #fff;" value="Add" >
                </select>
            </form>
        </div>


        <!--list question-->

        <div class="container bg-white p-3 my-3" >
            <div class="d-flex justify-content-center my-3">
                <h1 class="mx-auto">Question </h1>
            </div>
            <div>
                <c:forEach items="${test.questions}" var="o"  varStatus="status">
                    <div class="container  p-3 my-3" style="background-color: #3333332e">
                        <form id="form" action="question-update" method="post">
                            <input type="hidden" name="idCourse" value="${id}">      
                            <input type="hidden" name="id" value="${o.id}">
                            <div class="my-2">
                                <h6 class="title-name">Question ${status.index}</h6>
                                <textarea class="form-control" rows="3" readonly placeholder="Question" name="question" required>${o.question}</textarea>
                            </div>
                            <div class="d-flex justify-content-between align-items-center" >
                                <div class="my-2" style="width: 30%">
                                    <h6 class="title-name">Answer A</h6>
                                    <textarea class="form-control" readonly name="optionA" placeholder="Question" required>${o.optionA}</textarea>
                                </div>
                                <div class="my-2" style="width: 30%">
                                    <h6 class="title-name">Answer B</h6>
                                    <textarea class="form-control" readonly  name="optionB" placeholder="Question" required>${o.optionB} </textarea>
                                </div>
                                <div class="my-2" style="width: 30%">
                                    <h6 class="title-name">Answer C</h6>
                                    <textarea class="form-control" readonly name="optionC" placeholder="Question" required>${o.optionC}</textarea>
                                </div> 
                            </div>
                            <div class="my-2">    
                                <h6 class="title-name" >Right Answer</h6>
                                <select class="form-select" disabled="" required name="rightOption" value=""${o.rightOption}>
                                    <option value="1"  ${o.rightOption == "1"? "selected":""}>Answer A</option>
                                    <option value="2"  ${o.rightOption == "2"? "selected":""}>Answer B</option>
                                    <option value="3"  ${o.rightOption == "3"? "selected":""}>Answer C</option>
                                </select>
                            </div>  
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${o.id}">Remove</button>
                            <div class="modal fade" id="exampleModal${o.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Delete confirm</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Do you agree to remove Question ?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <a class="btn btn-danger" href="test-remove-question?idTest=${test.id}&idQuestion=${o.id}" role="button">Remove</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
