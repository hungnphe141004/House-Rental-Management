<%-- 
    Document   : home
    Created on : 25-06-2021, 08:30:14
    Author     : ADMIN
--%>


<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/user_detail.css">
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

                <div class="infoLeft" >
                    <c:if test="${m.gender==true}" >
                        <img src="img/male.jpg" height="300px" width="300px" alt=""/>
                    </c:if>
                    <c:if test="${m.gender!=true}" >
                        <img src="img/female.jpg" height="300px" width="300px" alt=""/>
                    </c:if>

                </div>
                <div class="infoRight" >
                    <h1>Name : ${m.name}</h1>
                    <h3>Date : ${m.dob}</h3>
                    <h3>Address : ${m.address}</h3>
                    <h3>CCCD : ${m.CCCD}</h3>
                    <h3>Gender : ${m.gender ? 'Nam' :'Nữ'}</h3>
                    
                    <c:if test="${sessionScope.user.type=='user'}">
                        <h3>Monney : ${m.monney} <a href="napthe.jsp?id=${m.id}"><button type="button" >Nạp tiền</button></a></h3>
                        <h3>Username : ${user.user}</h3>
                        <h3>Loại tài khoản : ${user.type}</h3>

                    </c:if>


                </div>












            </div>
        </div>
    </body>
</html>
