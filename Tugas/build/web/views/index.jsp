<%-- 
    Document   : index
    Created on : Jun 27, 2022, 10:11:14 PM
    Author     : Hudya
--%>

<%@page import="Controller.ProductController"%>
<%@page import="java.sql.ResultSet"%>
<%--<%@ taglib prefix="c" uri="http://java.sun/com/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Homepage" />
        </jsp:include>
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body class="d-flex flex-column h-100">
        <jsp:include page='layouts/navbar.jsp'></jsp:include>

        <%
            ProductController pc = new ProductController();

            String search = "";
            ResultSet rs;

            if (request.getParameter("search") != null) {
                search = request.getParameter("search");
            } 

            if (search.equals("")) {
                rs = pc.get();
            } else {
                rs = pc.getByName(search);
            }
        %>
        <!-- Begin page content -->
        <main class="flex-shrink-0">
            <div class="container">
                <div class="row pt-5">
                    <div class="col-6">
                        <form action="index" method="GET">
                            <div class="mb-3" style="margin-top: 20px;">
                                <label class="form-label">Cari nama barang</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="search" value="<%= search%>" />
                                    <span class="input-group-append">
                                        <button class="input-group-text bg-light d-block">
                                            <i class='bx bxs-search'></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-12">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Nama Barang</th>
                                    <th>Jenis</th>
                                    <th>Merk</th>
                                    <th>Tanggal Release</th>
                                    <th>Harga</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while (rs.next()) {%>
                                <tr>
                                    <td><%= rs.getString("id")%></td>
                                    <td><%= rs.getString("name")%></td>
                                    <td><%= rs.getString("product_type")%></td>
                                    <td><%= rs.getString("merk")%></td>
                                    <td><%= rs.getString("release_date")%></td>
                                    <td>Rp <%= rs.getString("price")%>,00</td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
    </body>
</html>