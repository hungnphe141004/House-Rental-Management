<%-- 
    Document   : napthe
    Created on : 01-07-2021, 03:51:52
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <!--- <iframe src="https://napthengay.vn/" width="100%" height="1320"
                frameborder="0" scrolling="no"></iframe>--->
        <form action="nap" method="get" >
            <input  type="text" name="money" > <button type="submit" >Nap</button>
            <input type="text" name="id" value="${param.id}" hidden=""  >
        </form>
    </body>
</html>
