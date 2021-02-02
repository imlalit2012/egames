<%@page import="com.learn.egames.helper.Helper"%>
<%@page import="com.learn.egames.entities.Category"%>
<%@page import="com.learn.egames.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.egames.dao.ProductDao"%>
<%@page import="com.learn.egames.entities.Product"%>
<%@page import="com.learn.egames.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EGaming Portal</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/common_modals.jsp"%>
        <div class="container-fluid">

            <div class="row mt-1 mx-2">

                <%  
                    String cat = request.getParameter("category");
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;

                    if (cat == null) {
                        list = dao.getAllProducts();
                    } else if (cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>


                <!--Show Categories-->
                <div class="col-md-2">
                    <div class="list-group mt-5">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
                            All Categories
                        </a>

                        <%
                            for (Category c : clist) {
                        %>

                        <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getTitle()%></a>
                        <%
                            }
                        %>                    
                    </div>  
                </div>

                <!--Show Products-->
                <div class="col-md-10">

                    <!--row-->
                    <div class="row">

                        <!--<col:12-->
                        <div class="col-md-12">
                            <div class="card-columns">

                                <!--traversing products-->
                                <%
                                    for (Product p : list) {
                                %>

                                <!-- Product Card-->
                                <div class="card product-card mt-5">
                                    <img  src="img/products/<%= p.getPhoto()%>" style="max-height:auto; max-width:100%; width:auto;" class="card-img-top m-2"  alt="...">
                                </div>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-white"><%= p.getTitle()%></h5>
                                <p class="card-text text-white"><%= Helper.get10Words(p.getDescription())%></p>
                            </div>
                            
                            <button class="btn btn-outline-primary font-weight-bold text-default" onclick="add_to_cart(<%= p.getProductId() %> , '<%= p.getTitle() %>', <%= p.getPriceAfterDiscount() %>)">Add to Cart</button>
                                <button class="btn btn-outline-primary font-weight-bold text-default"> &#8377; <%= p.getPriceAfterDiscount()%> /- <span class="text-white discount-label"> &#8377;<%= p.getPrice() %> , <%= p.getDiscount() %>% off </span></button>
                            </div>
                        </div>
                        <%}%>      
                </div>
            </div>
        </div>
    </body>
</html>
