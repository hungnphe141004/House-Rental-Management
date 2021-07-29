<%-- 
    Document   : home
    Created on :25-06-2021, 08:30:14
    Author     : ADMIN
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
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

                <div class="infoLeft" >
                    <c:if test="${room.roomType=='Vip'}" >
                        <img src="img/vip.jpg" alt=""/>
                    </c:if>
                    <c:if test="${room.roomType=='Normal'}" >
                        <img src="img/nomal.jpg" alt=""/>
                    </c:if>
                    <c:if test="${room.roomType=='Poor'}" >
                        <img src="img/poor.jpg" alt=""/>
                    </c:if>

                </div>
                <div class="infoRight" >

                    <h1>Tên phòng : ${room.name}</h1>
                    <h3>Loại phòng: ${room.roomType}</h3>
                    <h3>Trạng thái : ${room.available ? 'Hết phòng' :'Còn phòng'}</h3>
                    <h3> Giá điện (đ/kWh) : ${room.electricPrice} </h3>
                    <h3> Giá nước (đ/ m3) : ${room.waterPricce}</h3>
                    <h3> Giá wifi (1 tháng) : ${room.wifi}</h3>
                    <h3> Giá vệ sinh (1 tháng) : ${room.clean}</h3>
                    <h3> Giá phòng (1 tháng) : ${room.mothPrice}</h3>
                    </br>
                    <c:if test="${sessionScope.user.type!='admin'}">


                        <c:if test="${room.available==false}">
                            <a href="register_room?rid=${room.id}">  <button type="button" class="btn btn-success">Đăng ký ngay</button></a>

                        </c:if>
                    </c:if>






                </div>












            </div>
        </div>
    </body>
</html>