<%-- 
    Document   : login
    Created on : 25-06-2021, 08:41:03
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title><!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
    <body>
       <div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
				<div class="d-flex justify-content-end social_icon">
					<span ><i onclick="click1()"   class="fab fa-facebook-square"></i></span>
					<span><i onclick="click1()" class="fab fa-google-plus-square"></i></span>
					<span><i onclick="click1()" class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
                            <form action="login" method="post" >
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
                                            <input type="text" class="form-control" name="username" placeholder="username">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
                                            <input type="password" class="form-control" name="password" placeholder="password">
					</div>
<!--					<div class="row align-items-center remember">
						<input onclick="click1()" type="checkbox">Remember Me
					</div>-->
					<div class="form-group">
						<input   type="submit" value="Login" class="btn float-right login_btn">
                                                <p>-</p>
                                            <a href="Register.jsp" > <input   type="button" value="Register" class="btn float-right login_btn"></a>
					</div>
				</form>
			</div>
			
		</div>
	</div>
</div>

    </body>
    <script type="text/javascript">
         if ('${ mess}' != '') {
            alert('${mess}');
        }
	
	function click1() {
		alert("cái này để cho đẹp không có tác dụng gì đâu");
	}
</script>
</html>
