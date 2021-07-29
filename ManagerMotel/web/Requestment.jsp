<%-- 
    Document   : home
    Created on : 25-06-2021, 08:30:14
    Author     : ADMIN
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/requestment.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>Home</title>
    </head>
    <body>

        <div class="all">
          <div class="left">
                <div class="acc">
                    <c:if test="${sessionScope.user.type=='user'}">

                        <a href="user_detail" ><img src="img/user.png" alt=""/></a>
                        </c:if>
                        <c:if test="${sessionScope.user.type=='admin'}">
                        <a href="About me.jsp" ><h2>Admin</h2></a>
                        <a href="About me.jsp" > <img src="img/admin.png" alt=""/></a>
                        </c:if>
                    <a href="logout" ><button type="button" class="btn btn-danger">Logout</button></a> 



                </div>
                <!----context menu---->
                <div class="context">
                    <a href="home" ><button >Home</button></a>
                    <c:if test="${sessionScope.user.type=='user'}">
                        <a href="myRoom" ><button >My Room</button></a>
                    </c:if>
                    <c:if test="${sessionScope.user.type=='admin'}">
                        <a href="edit" ><button >Edit</button></a>
                        <a href="requestment" ><button >Requestment</button></a>

                    </c:if>
                    <a href="About me.jsp" ><button >About me</button></a>
                    <a href="intro.jsp" ><button >Introduction</button></a>
                </div>
            </div>
            <!----right--->
            <div class="right">
                <h1>Yêu cầu đăng ký phòng của người dùng</h1>

                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Tên phòng</th>
                            <th scope="col">Tên người dùng</th>
                            <th scope="col">Ngày</th>
                            <th scope="col">Opeartion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="f" >
                            <tr>
                                <th scope="row">${f.id}</th>
                                <td>${f.roomName}</td>
                                <td>${f.memberName}</td>
                                <td>${f.date}</td>
                                <td>
                                    <a href="requestment_op?id=${f.id}&rid=${f.roomId}&mid=${f.memberId}" ><button type="button" class="btn btn-success">Chấp nhận</button></a>
                                     <a href="requestment_op?id=${f.id}" ><button type="button" class="btn btn-danger">Từ chối</button></a>
                                    
                                </td>
                                
                            </tr>


                        </c:forEach>

                    </tbody>
                </table>












            </div>
        </div>
    </body>
</html>
