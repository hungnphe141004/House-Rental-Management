<%-- 
    Document   : intro
    Created on : 25-06-2021, 08:32:07
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Introduction</title>
        <link rel="stylesheet" type="text/css" href="css/intro.css">
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
                <h1>Building a website for hostel management</h1>
                <p>Nowadays, with more than 60% of Internet users researching online before they book their travel plans, having a website is essential for accommodation businesses. The number of visitors coming and going is constantly changing, they also use a variety of accompanying services, if only using traditional bookkeeping methods, it is not possible to manage rooms and customer information effectively. Therefore, building a hotel management website is essential for business and sustainable development.
                <p>

                <p>In the era of technological development, to facilitate business, most service businesses are equipped with great support tools. With hostels, too, building an inn management website brings a lot of convenience to directors, managers, and employees.
                     - Help save time, be professional in the working stages. Surely you will not want your customers to have to wait for the receptionist to turn each page of the book to find Booking information, room information, ... Instead, just a few simple steps. On the website, everything is solved.<p>


            </div>
        </div>
    </body>
</html>
