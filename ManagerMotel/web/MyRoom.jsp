<%-- 
    Document   : home
    Created on : 25-06-2021, 08:30:14
    Author     : ADMIN
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/room_detail_edit.css">
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

                <c:if test="${room ==null}">
                    <h1>B???n ch??a ????ng k?? ph??ng,h??y ?????i admin x??t duy???t y??u </h1>
                    <h1>Y??u c???u c???a b???n</h1>
                    <!----No room---->
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">T??n ph??ng</th>
                                <th scope="col">T??n ng?????i d??ng</th>
                                <th scope="col">Ng??y</th>
                                <th scope="col">Opeartion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="i" value="0" />
                            <c:forEach items="${listRq}" var="f"  >
                                <tr>

                                    <th scope="row">${i=i+1}</th>
                                    <td>${f.roomName}</td>
                                    <td>${f.memberName}</td>
                                    <td>${f.date}</td>
                                    <td>
                                        <a href="requestment_op?id=${f.id}" ><button type="button" class="btn btn-danger">H???y</button></a>

                                    </td>

                                </tr>


                            </c:forEach>

                        </tbody>
                    </table>

                    <!----No room---->
                </c:if>
                <c:if test="${room !=null}">
                    <!----have room---->
                    <div class="info">
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

                            <h1>T??n ph??ng : ${room.name}</h1>
                            <h3>Lo???i ph??ng: ${room.roomType}</h3>
                            <h3>Tr???ng th??i : ${room.available ? 'H???t ph??ng' :'C??n ph??ng'}</h3>
                            <h3> Gi?? ??i???n (??/kWh) : ${room.electricPrice} </h3>
                            <h3> Gi?? n?????c (??/ m3) : ${room.waterPricce}</h3>
                            <h3> Gi?? wifi (1 th??ng) : ${room.wifi}</h3>
                            <h3> Gi?? v??? sinh (1 th??ng) : ${room.clean}</h3>
                            <h3> Gi?? ph??ng (1 th??ng) : ${room.mothPrice}</h3>
                            <h3> Th??nh vi??n : ${member}</h3>
                            <a href="check_out?id=${m.id}" ><button type="button" class="btn btn-danger">Check out</button></a>
                            </br>
                        </div>
                    </div>
                    </br>
                    <h1>Chi ph??</h1>
                     <fmt:formatNumber var="monney" type = "number" 
                        groupingUsed = "false" value = "${m.monney}" />
                    <h1>Ti???n c???a b???n : ${monney} ??</h1>
                    

                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Th??ng</th>
                                <th scope="col">S??? ??i???n</th>
                                <th scope="col">S??? n?????c</th>
                                <th scope="col">T???ng ti???n ph??ng</th>
                                <th scope="col">Tr???ng th??i</th>
                                <th scope="col">Operation</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="f">
                                <tr >
                                    <th scope="row">${f.momth}</th>
                                    <td>${f.eletricNumber}</td>
                                    <td>${f.waterNumber}</td>
                                    <td>${f.total}</td>
                                    <td>${f.isPay ? '???? thanh to??n' :'Ch??a thanh to??n'}</td>
                                    <td>
                                        <c:if test="${f.isPay ==true}">
                                            <a href="" ><button type="button" disabled="" class="btn btn-success">Thanh to??n</button></a>
                                        </c:if>
                                        <c:if test="${f.isPay !=true}">
                                            <a href="pay_monney?total=${f.total}&monney=${monney}&mid=${m.id}&id=${f.id}" ><button type="button" class="btn btn-success">Thanh to??n</button></a>
                                        </c:if>


                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!----have room---->

                </c:if>


            </div>
        </div>
    </body>
    <script>
        if ('${ mess}' != '') {
            alert('${mess}');
        }
    </script>
</html>
