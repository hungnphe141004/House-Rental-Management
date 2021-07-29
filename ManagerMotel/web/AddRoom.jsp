<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Colorlib Templates">
        <meta name="author" content="Colorlib">
        <meta name="keywords" content="Colorlib Templates">

        <!-- Title Page-->
        <title>Room</title>

        <!-- Icons font CSS-->
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Vendor CSS-->
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/AddRoom.css" rel="stylesheet" media="all">

    </head>

    <body>
        <div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
            <div class="wrapper wrapper--w780">
                <div class="card card-3">
                    <div class="card-heading"></div>
                    <div class="card-body">
                        <h2 class="title">${operation == null ? 'Add' :operation } Room</h2>
                        <form action="add_room" method="get">
                            <div class="input-group">
                                <input class="input--style-3" type="text" placeholder="Room name" 
                                       pattern="[0-5][0-1][0-9]|[0-3]20"
                                       title="Room must between 101-120 ,there are 5 floors "
                                       required=""
                                       name="name"
                                       value="${r.name}">

                            </div>
                            <div class="input-group">
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select  required="" name="type">
                                        <option value="Vip" >Vip</option>
                                        <option value="Normal">Normal</option>
                                        <option value="Poor">Poor</option>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                                       <c:if test="${operation != null}">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select  required="" name="avai">
                                            <option value="ok" >Available</option>
                                            <option value="nok">Full</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>

                            </c:if>

                            <div class="input-group">
                                <input required="" class="input--style-3" type="number" 
                                       value="${r.electricPrice}" placeholder="Eletric Price" name="eletric">
                            </div>
                            <div class="input-group">
                                <input  required="" class="input--style-3" type="number"
                                        value="${r.waterPricce}" placeholder="Water Price" name="water">
                            </div>
                            <div class="input-group">
                                <input required="" class="input--style-3" type="number" 
                                       value="${r.wifi}" placeholder="Wifi" name="wifi">
                            </div>
                            <div class="input-group">
                                <input required="" class="input--style-3" type="number" 
                                       value="${r.clean}" placeholder="Cleaner" name="clean">
                            </div>
                            <div class="input-group">
                                <input required="" class="input--style-3"
                                       value="${r.mothPrice}"
                                       type="number" placeholder="Moth Price" name="moth">
                            </div>
                            <input type="text" value="${r.id}" name="id" hidden="">

                            <div class="p-t-10">
                                <button class="btn btn--pill btn--green" type="submit"> ${operation ==null ? 'Add' : operation} </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Jquery JS-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <!-- Vendor JS-->
        <script src="vendor/select2/select2.min.js"></script>
        <script src="vendor/datepicker/moment.min.js"></script>
        <script src="vendor/datepicker/daterangepicker.js"></script>

        <!-- Main JS-->
        <script src="js/global.js"></script>

    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->