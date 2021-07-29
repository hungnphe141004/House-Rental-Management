<%-- 
    Document   : About me
    Created on : 25-06-2021, 08:42:38
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About me</title>
        <link rel="stylesheet" type="text/css" href="css/About me.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
                     <c:if test="${sessionScope.user.type!=null}">
                        <a href="logout" ><button type="button" class="btn btn-danger">Logout</button></a> 
                    </c:if>
                    <c:if test="${sessionScope.user.type==null}">
                        <a href="login.jsp" ><button type="button" class="btn btn-success">Login</button></a> 
                    </c:if>



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
                <h1>Who are we</h1>
                CONTACT
                <p>If you encounter any problems during using Mr. Hung's services, please contact us via email, hotline or directly at the company's headquarters. Mr Hung is committed to responding to customers as quickly as possible. We always care about the opinions of customers and are committed to supporting information to bring maximum satisfaction to customers when using Mr. Hung's services.
                <p>
                <p>Mr. Hung's contact information is as follows:<p>

                <p>Mr. Hung COMPANY<p>

                <p>Headquarter address: FPT University
                <p>
                <p>Email: greyh2101@gmail.com<p>

                <p>Hotline: 0947254088<p>

<!--                <p>Hotline Sale: 123456789<p>-->


            </div>
        </div>
    </body>
</html>
