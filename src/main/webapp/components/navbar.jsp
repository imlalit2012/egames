<%@page import="com.learn.egames.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-light custom-bg">
    <div class="container">
        <a class="navbar-brand" href="about.jsp" style="font-size: 25px">EGaming</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp" style="font-size: 25px">Home<span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"  style="font-size: 25px" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
            </ul>

            
            <ul class="navbar-nav ml-auto">
                
                <li class="nav-item active">
                    <a class="nav-link" href="#!"data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 30px;"></i><span class="mt-0 cart-items" style="font-size: 20px;">( 0 )</span></a>
                 </li> 
                
                
                <%  if (user1 == null) {
                %> 
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp" style="font-size: 25px">Login</a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp" style="font-size: 25px">Register</a>
                </li>

                <%
                    } else {
                    %>
<li class="nav-item active">
                    <a class="nav-link" href="#!"><%=user1.getFirstName() %></a>
                </li>
                
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
                                        
                <%
                   }
                %>
            </ul>
        </div>
    </div>
</nav> 