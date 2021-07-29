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
        <link rel="stylesheet" type="text/css" href="css/home.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>Home</title>
    </head>
    <body>
        <%
            List<Room> list = new ArrayList<Room>();
            if (request.getAttribute("list") != null) {
                list = (List<Room>) request.getAttribute("list");
            }


        %>
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
                <h1>Danh sách các phòng</h1>
                <!-----table---------------->
                <table class="table">
                    <thead class="thead-red">
                        <tr>
                            <th scope="col">Tên phòng</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Loại phòng</th>
                            <th scope="col">Giá Phòng(1 tháng)</th>
                            <th scope="col">Operation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            for (Room r : list) {
                        %>
                        <tr>
                            <th scope="row">
                                <a href="room_detail?id=<%=r.getId()%>" ><%=r.getName()%></a> 
                            </th>
                            <td>
                                <%
                                    if (r.getAvailable() == false) {

                                %>
                                <p>Còn phòng</p>
                                <%                                } else {
                                %>
                                <p>Hết phòng</p>
                                <%
                                    }
                                %>
                            </td>
                            <td><%=r.getRoomType()%>  </td>
                            <td><%=r.getMothPrice()%> </td>
                            <c:if test="${sessionScope.user.type!='admin'}">
                                <td>
                                    <%
                                        if (r.getAvailable() == false) {
                                    %>
                                    <a href="register_room?rid=<%=r.getId()%>">  <button type="button" class="btn btn-success">Đăng ký ngay</button></a>
                                    <%
                                    } else {
                                    %>
                                    <button type="button" class="btn btn-success" disabled="true">Đăng ký ngay</button>
                                    <%
                                        }
                                    %>

                                </td>

                            </c:if>

                        </tr>


                        <%
                            }
                        %>


                    </tbody>
                </table>
                <!-----table---------------->
                <!------page--------------->
                <div class="page">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">

                            <li class="page-item"><a class="page-link" href="home?page=1">1</a></li>
                            <li class="page-item"><a class="page-link" href="home?page=2">2</a></li>
                            <li class="page-item"><a class="page-link" href="home?page=3">3</a></li>
                            <li class="page-item"><a class="page-link" href="home?page=4">4</a></li>
                            <li class="page-item"><a class="page-link" href="home?page=5">5</a></li>

                        </ul>
                    </nav>
                </div>

                <!------page--------------->
            </div>
        </div>
    </body>
    <script>
        if ('${ mess}' != '') {
            alert('${mess}');
        }
    </script>
</html>
