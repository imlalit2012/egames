<%@page import="java.util.List"%>
<%@page import="com.learn.egames.entities.Category"%>
<%@page import="com.learn.egames.helper.FactoryProvider"%>
<%@page import="com.learn.egames.dao.CategoryDao"%>
<%@page import="com.learn.egames.entities.User"%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getType() == "normal") {
            session.setAttribute("message", "You are not an Admin !! Cannot access the page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Login</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>
        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>

            <div class="row mt-3">

                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class= "img-fluid rounded-circle" src="img/user.jpeg" alt="user_icon">
                            </div>
                            <h1 class="text-muted">1012</h1>
                            <p>Click to View Users</p>
                            <h1>Users</h1>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class= "img-fluid rounded-circle" src="img/List.png" alt="user_icon">
                            </div>
                            <h1 class="text-muted">2012</h1>
                            <p>Click to View Categories</p>
                            <h1>Categories</h1>
                        </div>
                    </div>    

                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class= img-fluid rounded-circle" src="img/Category.png" alt="user_icon">
                            </div>

                            <h1 class="text-muted">3012</h1>
                            <p>Click to View Products</p>
                            <h1>Products</h1>
                        </div>
                    </div>

                </div>

            </div>

            <!--second row-->

            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#Add-Categories-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class= img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
                            </div>

                            <h1 class="text-muted">3012</h1>
                            <p>Click to Add Categories</p>
                            <h1>Add Categories</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class= img-fluid rounded-circle" src="img/add product.png" alt="user_icon">
                            </div>

                            <h1 class="text-muted">3012</h1>
                            <p>Click to Add Products</p>
                            <h1>Add Products</h1>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Category Modal -->
        <div class="modal fade" id="Add-Categories-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add Category Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addCategory"> 
                            <div class="form-group">
                                <input type class="form-control" name="catTitle" placeholder="Enter Category Title"  autocomplete="off" required />                                
                            </div>    

                            <div class="form-group">
                                <textarea style="height:150px" class="form-control" name="catDescription" placeholder="Enter Category Description" required /></textarea>    
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-primary">Add Category</button>
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Category Modal -->


        <!-- Product Modal -->

        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                       
                        <!-- form -->

                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="addProduct"/>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter Product Title" name="Title" autocomplete="off" required />
                            </div>    

                            <div>
                                <textarea style="height:150px" class="form-control" placeholder="Enter Product Description" name="Description" required></textarea>
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Product Price" name="Price" autocomplete="off" required />
                            </div>
                            
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Product Discount" name="Discount"  autocomplete="off" required />
                            </div>

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Product Quantity " name="Quantity" autocomplete="off" required />
                            </div>

                            <!-- Product Category-->

                            <%  
                                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();  
                            %>

                            <div class="form-group">
                                <select name="catId" class="form-control"  id="">


                                    <% 
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getTitle()%> </option>

                                    <% } %>

                                </select>
                            </div>    

                            <!-- Product File-->

                            <div class="form-group">
                                <label for="Photo">Select Picture of Product</label>
                                <br>
                                <input type="file" name="Photo" required />
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-primary">Add Product</button>
                            </div>

                        </form>

                        <!-- end form -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>



        <!-- End Product Modal -->

    </body>
</html>

