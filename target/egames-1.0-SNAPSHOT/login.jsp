<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-5">

                        <div class="card-header text-center custom-bg text-white">
                            <h3>! User Login !</h3>
                        </div>
                        <div class="card-body px-5">
                            <%@include file="components/message.jsp" %>

                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="email">Email Id</label>
                                    <input name="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="password" type=password" class="form-control" id="password" placeholder="Enter here">
                                </div>
                                <a href="register.jsp" class="d-block mb-3">New to EGaming? Create an account</a>  

                                <div class="container text-center">
                                    <button class="btn btn-outline-primary">Login</button>
                                    <button class="btn btn-outline-danger">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>      
                </div>
            </div>
        </div>
    </div>
</body>
</html>
