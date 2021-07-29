<%-- 
    Document   : About me
    Created on : 25-06-2021, 08:42:38
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Payment</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,600" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/AddPayment.css" />

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
                  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                <![endif]-->

    </head>

    <body>
        <div id="booking" class="section">
            <div class="section-center">
                <div class="container">
                    <div class="row">
                        <div class="booking-form">
                            <form action="addPayment"  method="get">
                                <input type="text" value="${param.rid}" hidden="" name="rid" >
                                <input type="text" value="${p.room.id}" hidden="" name="RID" >
                                <input type="text" value="${p.id}"  hidden="" name="id" >
                                 <div class="col-md-4">
                                    <div class="form-group">
                                        <input class="form-control" value="${p.momth}"  name="momth" type="number" required>
                                        <span class="form-label">Tháng</span>
                                    </div>
                                </div>

                               

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <input class="form-control" value="${p.eletricNumber}" name="eletric" type="number" required>
                                        <span class="form-label">Số điện</span>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <input class="form-control"  value="${p.waterNumber}" name="water" type="number" required>
                                        <span class="form-label">Số nước</span>
                                    </div>
                                </div>
                                 <div class="col-md-4">
                                    <div class="form-group">
                                        <select name="isPay" class="form-control">
                                            <option value="ok">Đã thanh toán</option>
                                            <option value="nok" >Chưa thanh toán</option>

                                        </select>
                                        <span class="select-arrow"></span>
                                        <span class="form-label">Tình trạng</span>
                                    </div>
                                </div>
                               
                                <div class="col-md-4">
                                    <div class="form-btn">
                                        <button class="submit-btn">Add</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
