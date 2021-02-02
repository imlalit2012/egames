<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">

            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                         
                        <div class="card-body px-5">
                            <%@include file="components/message.jsp" %>
                            <h3 class="text-center my-3">! Registration Form !</h3>


                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="fname">First Name</label>
                                    <input name="first_name" type="text" class="form-control" id="fname" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="lname">Last Name</label>
                                    <input name="last_name" type="text" class="form-control" id="lname"  placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="contact">Contact Number</label>
                                    <input name="contact_number" type="number" class="form-control" id="contact"  placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="email">Email Id</label>
                                    <input name="email_id" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="user_password" type=password" class="form-control" id="password" placeholder="Enter here">
                                </div>

                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea name="user_address" style="height: 40px"class="form-control" placeholder="Enter here"></textarea>
                                </div>
                                <a href="login.jsp" class="d-block mb-3">Existing User? Login in</a>  

                                <div class="container">
                                    <button class="btn btn-outline-primary">Register</button>
                                    <button class="btn btn-outline-danger">Reset</button>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
